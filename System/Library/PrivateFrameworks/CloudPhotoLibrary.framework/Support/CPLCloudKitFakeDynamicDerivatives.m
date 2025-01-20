@interface CPLCloudKitFakeDynamicDerivatives
+ (BOOL)_transferImageFromSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 matchingResource:(id)a5;
+ (BOOL)allowsFakeDerivatives;
+ (BOOL)isFakeDerivative:(id)a3;
+ (BOOL)transformFromURL:(id)a3 fileType:(id)a4 toTargetURL:(id)a5 matchingResource:(id)a6 error:(id *)a7;
+ (BOOL)usesFakeDerivatives;
+ (NSString)fakeDerivativesDescription;
+ (id)_metadataWithoutOrientation:(id)a3;
+ (id)_outputOptionsFromSource:(CGImageSource *)a3 matchingResource:(id)a4;
+ (id)overriddenResourcesFromResources:(id)a3;
+ (id)transformData:(id)a3 fileType:(id)a4 matchingResource:(id)a5 error:(id *)a6;
+ (unint64_t)realResourceTypeForResource:(id)a3;
+ (void)setAllowsFakeDerivatives:(BOOL)a3;
@end

@implementation CPLCloudKitFakeDynamicDerivatives

+ (BOOL)allowsFakeDerivatives
{
  return byte_1002CE600;
}

+ (NSString)fakeDerivativesDescription
{
  if (byte_1002CE601 == 1 && [(id)qword_1002CE5F8 count])
  {
    id v2 = objc_alloc((Class)NSMutableArray);
    id v3 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend((id)qword_1002CE5F8, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = (id)qword_1002CE5F8;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "description", (void)v12);
          [v3 addObject:v9];
        }
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    v10 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

+ (void)setAllowsFakeDerivatives:(BOOL)a3
{
  if (a3)
  {
    id v5 = +[NSUserDefaults standardUserDefaults];
    id v6 = [v5 stringForKey:@"CPLFakeDynamicDerivatives"];

    if (v6)
    {
      id v22 = a1;
      uint64_t v7 = [v6 componentsSeparatedByString:@","];
      id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = v7;
      id v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v24;
        while (2)
        {
          long long v13 = 0;
          do
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v13);
            long long v15 = [[_CPLFakeDerivativeMapper alloc] initWithRule:v14];
            if (!v15)
            {
              if (!_CPLSilentLogging)
              {
                v20 = __CPLGenericOSLogDomain();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v28 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Invalid fake derivative rule '%@'", buf, 0xCu);
                }
              }
              if (!_CPLSilentLogging)
              {
                v21 = __CPLGenericOSLogDomain();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v28 = v6;
                  _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to parse fake derivatives rules '%@'", buf, 0xCu);
                }
              }
              byte_1002CE601 = 0;
              v17 = qword_1002CE5F8;
              qword_1002CE5F8 = 0;
              goto LABEL_24;
            }
            v16 = v15;
            [v8 addObject:v15];

            long long v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          id v11 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      byte_1002CE601 = 1;
      objc_storeStrong((id *)&qword_1002CE5F8, v8);
      if (!_CPLSilentLogging)
      {
        v17 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = [v22 fakeDerivativesDescription];
          *(_DWORD *)buf = 138412290;
          v28 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will produce fake derivatives: %@", buf, 0xCu);
        }
LABEL_24:
      }
    }
  }
  else
  {
    byte_1002CE601 = 0;
    v19 = (void *)qword_1002CE5F8;
    qword_1002CE5F8 = 0;
  }
  byte_1002CE600 = a3;
}

+ (BOOL)usesFakeDerivatives
{
  return byte_1002CE601;
}

+ (id)overriddenResourcesFromResources:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (byte_1002CE601 == 1 && [v3 count])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 resourceType]);
          [v5 setObject:v11 forKeyedSubscript:v12];
        }
        id v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v13 = (id)qword_1002CE5F8;
    id v14 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)j), "updateResources:", v5, (void)v20);
        }
        id v15 = [v13 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v15);
    }

    id v18 = [v5 allValues];
  }
  else
  {
    id v18 = v4;
  }

  return v18;
}

+ (BOOL)isFakeDerivative:(id)a3
{
  if (byte_1002CE601 != 1) {
    return 0;
  }
  id v3 = [a3 identity];
  id v4 = [v3 fingerPrint];
  unsigned __int8 v5 = [v4 hasPrefix:@"^"];

  return v5;
}

+ (unint64_t)realResourceTypeForResource:(id)a3
{
  id v3 = a3;
  id v4 = [_CPLCloudKitFakeFingerPrint alloc];
  unsigned __int8 v5 = [v3 identity];
  id v6 = [(_CPLCloudKitFakeFingerPrint *)v4 initWithFakeIdentity:v5];

  if (v6) {
    id v7 = [(_CPLCloudKitFakeFingerPrint *)v6 realResourceType];
  }
  else {
    id v7 = [v3 resourceType];
  }
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

+ (id)_metadataWithoutOrientation:(id)a3
{
  id v3 = a3;
  id v4 = [v3 mutableCopy];
  [v4 removeObjectForKey:kCGImagePropertyOrientation];
  unsigned __int8 v5 = [v3 objectForKey:kCGImagePropertyTIFFDictionary];

  id v6 = [v5 mutableCopy];
  if (v6)
  {
    [v6 removeObjectForKey:kCGImagePropertyTIFFOrientation];
    [v4 setObject:v6 forKey:kCGImagePropertyTIFFDictionary];
  }

  return v4;
}

+ (id)_outputOptionsFromSource:(CGImageSource *)a3 matchingResource:(id)a4
{
  CFStringRef v18 = @"kCGImageSourceKeepOriginalProfile";
  CFBooleanRef v19 = kCFBooleanTrue;
  id v6 = a4;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  CFDictionaryRef v8 = CGImageSourceCopyPropertiesAtIndex(a3, 0, v7);
  uint64_t v9 = [a1 _metadataWithoutOrientation:v8];
  [v9 setObject:&off_1002943C8 forKey:kCGImageDestinationLossyCompressionQuality];
  id v10 = [v6 identity];

  [v10 imageDimensions];
  double v12 = v11;
  double v14 = v13;

  if (v12 >= v14) {
    double v15 = v12;
  }
  else {
    double v15 = v14;
  }
  uint64_t v16 = +[NSNumber numberWithInt:(int)v15];
  [v9 setObject:v16 forKey:kCGImageDestinationImageMaxPixelSize];

  [v9 setObject:&__kCFBooleanTrue forKey:kCGImageSourceCreateThumbnailWithTransform];
  return v9;
}

+ (BOOL)_transferImageFromSource:(CGImageSource *)a3 toDestination:(CGImageDestination *)a4 matchingResource:(id)a5
{
  CFDictionaryRef v7 = [a1 _outputOptionsFromSource:a3 matchingResource:a5];
  CGImageDestinationAddImageFromSource(a4, a3, 0, v7);
  LOBYTE(a4) = CGImageDestinationFinalize(a4);

  return (char)a4;
}

+ (BOOL)transformFromURL:(id)a3 fileType:(id)a4 toTargetURL:(id)a5 matchingResource:(id)a6 error:(id *)a7
{
  CFURLRef v12 = (const __CFURL *)a3;
  id v13 = a4;
  CFURLRef v14 = (const __CFURL *)a5;
  id v15 = a6;
  uint64_t v16 = [_CPLCloudKitFakeFingerPrint alloc];
  v17 = [v15 identity];
  CFStringRef v18 = [(_CPLCloudKitFakeFingerPrint *)v16 initWithFakeIdentity:v17];

  if (v18)
  {
    if (v13)
    {
      CFStringRef v33 = kCGImageSourceTypeIdentifierHint;
      id v34 = v13;
      CFDictionaryRef v19 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    }
    else
    {
      CFDictionaryRef v19 = 0;
    }
    CGImageSourceRef v23 = CGImageSourceCreateWithURL(v12, v19);
    if (!v23)
    {
      unsigned __int8 v20 = 0;
      if (!a7) {
        goto LABEL_18;
      }
      goto LABEL_16;
    }
    CGImageSourceRef v24 = v23;
    CFURLRef v31 = v12;
    long long v25 = a7;
    id v26 = a1;
    long long v27 = [(_CPLCloudKitFakeFingerPrint *)v18 outputType];
    CFURLRef v28 = v14;
    CGImageDestinationRef v29 = CGImageDestinationCreateWithURL(v14, v27, 1uLL, 0);

    if (v29)
    {
      unsigned __int8 v20 = [v26 _transferImageFromSource:v24 toDestination:v29 matchingResource:v15];
      CFRelease(v29);
    }
    else
    {
      unsigned __int8 v20 = 0;
    }
    a7 = v25;
    CFRelease(v24);
    CFURLRef v14 = v28;
    CFURLRef v12 = v31;
    if (v25)
    {
LABEL_16:
      if ((v20 & 1) == 0)
      {
        *a7 = +[CPLErrors unknownError];
      }
    }
  }
  else
  {
    CFDictionaryRef v19 = +[NSFileManager defaultManager];
    id v32 = 0;
    unsigned __int8 v20 = [(__CFDictionary *)v19 cplCopyItemAtURL:v12 toURL:v14 error:&v32];
    id v21 = v32;
    long long v22 = v21;
    if (a7 && (v20 & 1) == 0) {
      *a7 = v21;
    }
  }
LABEL_18:

  return v20;
}

+ (id)transformData:(id)a3 fileType:(id)a4 matchingResource:(id)a5 error:(id *)a6
{
  CFDataRef v9 = (const __CFData *)a3;
  id v10 = a4;
  id v11 = a5;
  CFURLRef v12 = [_CPLCloudKitFakeFingerPrint alloc];
  id v13 = [v11 identity];
  CFURLRef v14 = [(_CPLCloudKitFakeFingerPrint *)v12 initWithFakeIdentity:v13];

  if (v14)
  {
    if (v10)
    {
      CFStringRef v22 = kCGImageSourceTypeIdentifierHint;
      id v23 = v10;
      CFDictionaryRef v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    }
    else
    {
      CFDictionaryRef v15 = 0;
    }
    CGImageSourceRef v17 = CGImageSourceCreateWithData(v9, v15);
    if (v17)
    {
      CGImageSourceRef v18 = v17;
      uint64_t v16 = (__CFData *)objc_alloc_init((Class)NSMutableData);
      CFDictionaryRef v19 = [(_CPLCloudKitFakeFingerPrint *)v14 outputType];
      CGImageDestinationRef v20 = CGImageDestinationCreateWithData(v16, v19, 1uLL, 0);

      if (v20)
      {
        if (([a1 _transferImageFromSource:v18 toDestination:v20 matchingResource:v11] & 1) == 0)
        {

          uint64_t v16 = 0;
        }
        CFRelease(v20);
      }
      CFRelease(v18);
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = v9;
  }

  return v16;
}

@end