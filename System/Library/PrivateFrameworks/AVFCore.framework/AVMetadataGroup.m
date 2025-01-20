@interface AVMetadataGroup
+ (void)initialize;
- (NSArray)items;
- (NSString)classifyingLabel;
- (NSString)uniqueID;
- (opaqueCMFormatDescription)copyFormatDescription;
@end

@implementation AVMetadataGroup

+ (void)initialize
{
}

- (NSArray)items
{
  return (NSArray *)[MEMORY[0x1E4F1C978] array];
}

- (opaqueCMFormatDescription)copyFormatDescription
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = [(AVMetadataGroup *)self items];
  id v50 = 0;
  CMMetadataFormatDescriptionRef formatDescriptionOut = 0;
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v47 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = [*(id *)(*((void *)&v46 + 1) + 8 * v9) _figMetadataSpecificationReturningError:&v50];
      if (!v10) {
        break;
      }
      [v5 addObject:v10];
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v46 objects:v53 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    OSStatus v11 = CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0x6D656278u, (CFArrayRef)v5, &formatDescriptionOut);
    if (v11 == -16307)
    {
      v20 = NSString;
      uint64_t v21 = [(NSArray *)v4 componentsJoinedByString:@", "];
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      uint64_t v24 = [v20 stringWithFormat:@"The identifier for one or more of the following items is invalid: %@.  See +[%@ %@] for a way to construct a valid identifier from a key and key space", v21, v23, NSStringFromSelector(sel_identifierForKey_keySpace_)];
      v25 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v26 = *MEMORY[0x1E4F1C3B8];
LABEL_21:
      v19 = (void *)AVErrorForClientProgrammingError([v25 exceptionWithName:v26 reason:v24 userInfo:0]);
    }
    else
    {
      signed int v12 = v11;
      if (v11 == -12710)
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v13 = [v5 countByEnumeratingWithState:&v42 objects:v52 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v43;
          uint64_t v16 = *MEMORY[0x1E4F1F0F8];
          while (2)
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v43 != v15) {
                objc_enumerationMutation(v5);
              }
              CFStringRef v18 = (const __CFString *)[*(id *)(*((void *)&v42 + 1) + 8 * i) objectForKey:v16];
              if (!CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(v18))
              {
                v30 = (void *)MEMORY[0x1E4F1CA00];
                uint64_t v31 = *MEMORY[0x1E4F1C3C8];
                uint64_t v24 = [NSString stringWithFormat:@"Data type \"%@\" does not conform to any built-in data type.  See CMMetadataDataTypeRegistryRegisterDataType.", v18];
                v25 = v30;
                uint64_t v26 = v31;
                goto LABEL_21;
              }
            }
            uint64_t v14 = [v5 countByEnumeratingWithState:&v42 objects:v52 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
      }
      else if (!v11)
      {
        goto LABEL_24;
      }
      v19 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v12, 0);
    }
    id v50 = v19;
  }
LABEL_24:
  v27 = formatDescriptionOut;
  if (!formatDescriptionOut)
  {
    id v28 = v50;
    if ([v50 code] == -11999)
    {
      v32 = objc_msgSend((id)objc_msgSend(v28, "userInfo"), "objectForKey:", @"AVErrorExceptionKey");
      uint64_t v33 = [v32 reason];
      v34 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v40 = [v32 name];
      if (v33) {
        [NSString stringWithFormat:@": %@", v33];
      }
      v41 = (void *)[v34 exceptionWithName:v40, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Cannot create format description for metadata group %p%@", v35, v36, v37, v38, v39, (uint64_t)self), 0 reason userInfo];
      objc_exception_throw(v41);
    }
  }
  return v27;
}

- (NSString)classifyingLabel
{
  return 0;
}

- (NSString)uniqueID
{
  return 0;
}

@end