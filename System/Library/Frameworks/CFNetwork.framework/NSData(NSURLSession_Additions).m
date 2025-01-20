@interface NSData(NSURLSession_Additions)
- (id)_requestFromResumeData;
- (void)_isSafeResumeDataForBackgroundDownload;
@end

@implementation NSData(NSURLSession_Additions)

- (id)_requestFromResumeData
{
  if (!a1) {
    goto LABEL_5;
  }
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:a1 error:0];
  [v2 setDecodingFailurePolicy:1];
  if (resumeDataClasses(void)::onceToken != -1) {
    dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_3749);
  }
  id v3 = (id)objc_msgSend((id)objc_msgSend(v2, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, @"NSKeyedArchiveRootObjectKey"), "mutableCopy");
  [v2 finishDecoding];
  if (!v3) {
LABEL_5:
  }
    id v3 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:a1 options:0 format:0 error:0];
  uint64_t v4 = [v3 objectForKey:@"NSURLSessionResumeCurrentRequest"];
  id v5 = (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:0];
  if (!v5)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
    if (v6)
    {
      v7 = v6;
      if (resumeDataClasses(void)::onceToken != -1) {
        dispatch_once(&resumeDataClasses(void)::onceToken, &__block_literal_global_3749);
      }
      id v5 = (id)objc_msgSend((id)objc_msgSend(v7, "decodeObjectOfClasses:forKey:", resumeDataClasses(void)::resumeDataClasses, @"NSKeyedArchiveRootObjectKey"), "copy");
      [v7 finishDecoding];
    }
    else
    {
      id v5 = 0;
    }
  }

  return v5;
}

- (void)_isSafeResumeDataForBackgroundDownload
{
  result = (void *)[a1 _requestFromResumeData];
  if (result)
  {
    return (void *)[result _isSafeRequestForBackgroundDownload];
  }
  return result;
}

@end