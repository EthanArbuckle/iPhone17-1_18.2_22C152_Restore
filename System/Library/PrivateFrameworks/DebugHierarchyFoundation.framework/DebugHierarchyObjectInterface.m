@interface DebugHierarchyObjectInterface
+ (id)propertyDescriptionsForClass:(Class)a3 inContext:(id)a4;
+ (id)valueAndOptionsForProperty:(id)a3 onObject:(id)a4 inContext:(id)a5;
+ (id)valueForProperty:(id)a3 withOutOptions:(id *)a4 onObject:(id)a5 inContext:(id)a6 error:(id *)a7;
@end

@implementation DebugHierarchyObjectInterface

+ (id)valueAndOptionsForProperty:(id)a3 onObject:(id)a4 inContext:(id)a5
{
  id v8 = a3;
  id v31 = 0;
  id v32 = 0;
  v9 = [a1 valueForProperty:v8 withOutOptions:&v32 onObject:a4 inContext:a5 error:&v31];
  id v10 = v32;
  id v11 = v31;
  if (v11)
  {
    uint64_t v12 = [v8 name];
    v13 = (void *)v12;
    v14 = @"<nil>";
    if (v12) {
      v14 = (__CFString *)v12;
    }
    v15 = v14;

    v34[0] = &off_2DF50;
    v33[0] = @"fetchStatus";
    v33[1] = @"errorDescription";
    v16 = [v11 description];
    v33[2] = @"propertyName";
    v34[1] = v16;
    v34[2] = v15;
    id v17 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  }
  else
  {
    if ([v10 count])
    {
      id v18 = [v10 mutableCopy];
    }
    else
    {
      id v18 = +[NSMutableDictionary dictionaryWithCapacity:2];
    }
    v16 = v18;
    [v18 setObject:&off_2DF38 forKeyedSubscript:@"fetchStatus"];
    v19 = [v8 name];
    [v16 setObject:v19 forKeyedSubscript:@"propertyName"];

    if (v9) {
      [v16 setObject:v9 forKeyedSubscript:@"propertyValue"];
    }
    v20 = [v16 objectForKeyedSubscript:@"propertyFormat"];

    if (!v20)
    {
      v21 = [v8 format];
      if (v21) {
        [v16 setObject:v21 forKeyedSubscript:@"propertyFormat"];
      }
    }
    id v22 = [v16 copy];
    id v30 = 0;
    v23 = DBGSerializePropertyDescriptionAsJSON(v22, &v30);
    v15 = (__CFString *)v30;

    if (v15)
    {
      uint64_t v24 = [v8 name];
      v25 = (void *)v24;
      v26 = @"<nil>";
      if (v24) {
        v26 = (__CFString *)v24;
      }
      v27 = v26;

      v36[0] = &off_2DF50;
      v35[0] = @"fetchStatus";
      v35[1] = @"errorDescription";
      v28 = [(__CFString *)v15 description];
      v35[2] = @"propertyName";
      v36[1] = v28;
      v36[2] = v27;
      id v17 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:3];
    }
    else
    {
      id v17 = v23;
    }
  }
  return v17;
}

+ (id)valueForProperty:(id)a3 withOutOptions:(id *)a4 onObject:(id)a5 inContext:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a5;
  id v69 = a6;
  if (+[DebugHierarchyObjectProtocolHelper classImplements_debugHierarchyValueForPropertyWithName:objc_opt_class()])
  {
    id v12 = v11;
    v13 = (objc_class *)objc_opt_class();
    v14 = v13;
    if (v13 && object_isClass(v13))
    {
      v15 = NSStringFromClass(v14);
    }
    else
    {
      v15 = 0;
    }

    v16 = [v69 runtimeTypeWithName:v15];

    id v17 = v16;
    v68 = v17;
    if (v17)
    {
      id v18 = v17;
      do
      {
        v19 = [v18 instanceProperties];
        v20 = [v10 name];
        v21 = [v19 objectForKeyedSubscript:v20];

        if (v21) {
          id v22 = v18;
        }
        else {
          id v22 = 0;
        }
        v23 = [v18 parentType];

        if (v22) {
          break;
        }
        id v18 = v23;
      }
      while (v23);
    }
    else
    {
      id v22 = 0;
      v23 = 0;
    }
    uint64_t v24 = [v22 name];
    Class v25 = NSClassFromString(v24);
    v67 = a4;

    if (!v25) {
      goto LABEL_23;
    }
    v26 = [v10 name];
    id v72 = 0;
    id v73 = 0;
    id v27 = +[DebugHierarchyObjectProtocolHelper debugHierarchyValueForPropertyWithName:v26 onObject:v12 vendingClass:v25 outOptions:&v73 outError:&v72];
    Class v25 = (Class)v73;
    id v28 = v72;

    if (v28)
    {
      Mutable = v27;
LABEL_32:
      if (+[DebugHierarchyValueProtocolHelper objectImplementsRequiredDebugHierarchyValueMethods:Mutable])
      {
        id v70 = 0;
        id v71 = 0;
        id v41 = +[DebugHierarchyValueProtocolHelper debugHierarchyValueWithOutOptions:&v71 outError:&v70 onObject:Mutable];
        id v42 = v71;
        id v43 = v70;
        if (v43)
        {
          v44 = v43;

          id v41 = 0;
        }
        else
        {
          id v45 = v42;
          id *v67 = v45;
        }
      }
      else
      {
        id v41 = Mutable;
      }

      goto LABEL_76;
    }
    if (v27)
    {
      id v30 = [v10 logicalType];
      unsigned int v31 = [v30 isEqualToString:@"DebugHierarchyLogicalPropertyTypeObjectInfo"];

      if (v31)
      {
        id v32 = v27;
        v33 = (objc_class *)objc_opt_class();
        v34 = v33;
        if (v33 && object_isClass(v33))
        {
          NSStringFromClass(v34);
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v35 = 0;
        }

        v38 = &stru_29008;
        if (v35) {
          v38 = v35;
        }
        v39 = v38;

        id v27 = v32;
        v40 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v27);

        values[0] = @"className";
        values[1] = @"memoryAddress";
        keys[0] = v39;
        keys[1] = v40;
        Mutable = +[NSDictionary dictionaryWithObjects:keys forKeys:values count:2];
      }
      else
      {
        v36 = [v10 logicalType];
        unsigned int v37 = [v36 isEqualToString:@"DebugHierarchyLogicalPropertyTypePointer"];

        if (v37)
        {
          Mutable = +[NSString stringWithFormat:@"%p", v27];
        }
        else
        {
          CFTypeID v46 = CFGetTypeID(v27);
          if (v46 == CGColorGetTypeID())
          {
            Mutable = CFDictionaryCreateMutable(0, 20, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            space = CGColorGetColorSpace((CGColorRef)v27);
            CFStringRef value = CGColorSpaceCopyName(space);
            size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)v27);
            uint64_t numValues = (int)NumberOfComponents;
            uint64_t v62 = NumberOfComponents << 32;
            if (NumberOfComponents << 32)
            {
              theString = CFStringCreateMutable(0, 0);
              uint64_t v48 = numValues - 1;
              if ((unint64_t)numValues <= 1) {
                uint64_t v49 = 1;
              }
              else {
                uint64_t v49 = numValues;
              }
              do
              {
                CFStringAppend(theString, @"CGf");
                if (v48) {
                  CFStringAppend(theString, @", ");
                }
                --v48;
                --v49;
              }
              while (v49);
            }
            else
            {
              theString = &stru_29008;
            }
            Components = CGColorGetComponents((CGColorRef)v27);
            v64 = (void **)malloc_type_malloc(v62 >> 29, 0x6004044C4A2DFuLL);
            if (v62 >= 1)
            {
              if (numValues <= 1) {
                uint64_t v54 = 1;
              }
              else {
                uint64_t v54 = numValues;
              }
              v55 = (CFNumberRef *)v64;
              do
              {
                *v55++ = CFNumberCreate(0, kCFNumberCGFloatType, Components++);
                --v54;
              }
              while (v54);
            }
            CFArrayRef v56 = CFArrayCreate(0, (const void **)v64, numValues, &kCFTypeArrayCallBacks);
            if (v62 >= 1)
            {
              if (numValues <= 1) {
                uint64_t v57 = 1;
              }
              else {
                uint64_t v57 = numValues;
              }
              v58 = (CFTypeRef *)v64;
              do
              {
                CFRelease(*v58++);
                --v57;
              }
              while (v57);
            }
            free(v64);
            CGColorSpaceGetModel(space);
            if (v56) {
              CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValues", v56);
            }
            if (theString) {
              CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"componentValuesFormat", theString);
            }
            if (value) {
              CFDictionaryAddValue((CFMutableDictionaryRef)Mutable, @"colorSpaceName", value);
            }
            if (v56) {
              CFRelease(v56);
            }
            if (value) {
              CFRelease(value);
            }
            if (theString) {
              CFRelease(theString);
            }
          }
          else
          {
            if (v46 != CGImageGetTypeID())
            {
              Mutable = v27;
              goto LABEL_31;
            }
            CFStringRef v50 = [v10 format];
            int valuePtr = 1065353216;
            Mutable = CFDataCreateMutable(0, 0);
            v51 = CGImageDestinationCreateWithData((CFMutableDataRef)Mutable, v50, 1uLL, 0);
            CFMutableStringRef theStringa = (CFMutableStringRef)CFNumberCreate(kCFAllocatorDefault, kCFNumberFloatType, &valuePtr);
            keys[0] = (void *)kCGImageDestinationLossyCompressionQuality;
            values[0] = theStringa;
            CFDictionaryRef v52 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)keys, (const void **)values, 1, 0, 0);
            CGImageDestinationAddImage(v51, (CGImageRef)v27, v52);
            CGImageDestinationFinalize(v51);
            CFRelease(v52);
            CFRelease(theStringa);
            CFRelease(v51);

            id v27 = (id)v50;
          }
        }
      }
    }
    else
    {
LABEL_23:
      Mutable = 0;
    }
LABEL_31:
    Class v25 = v25;
    id v28 = 0;
    id *v67 = v25;
    goto LABEL_32;
  }
  id v41 = 0;
LABEL_76:

  return v41;
}

+ (id)propertyDescriptionsForClass:(Class)a3 inContext:(id)a4
{
  id v5 = a4;
  if (+[DebugHierarchyObjectProtocolHelper classOverrides_debugHierarchyPropertyDescriptions:a3])
  {
    v6 = +[DebugHierarchyObjectProtocolHelper debugHierarchyPropertyDescriptionsOfClass:a3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end