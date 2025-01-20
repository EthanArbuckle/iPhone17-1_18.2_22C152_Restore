@interface ConverterUtils
+ (Reader)getCppReaderFromObjCObject:(SEL)a3;
+ (id)convertMentionDetectorResponseFromCppToObjC:(void *)a3;
+ (id)convertMentionResolverResponseFromCppToObjC:(void *)a3;
+ (unique_ptr<sirinluinternalmention_detector::MentionDetectorRequest,)convertMentionDetectorRequestFromObjCToCpp:(id)a3;
+ (unique_ptr<sirinluinternalmention_resolver::MentionResolverRequest,)convertMentionResolverRequestFromObjCToCpp:(id)a3;
@end

@implementation ConverterUtils

+ (id)convertMentionDetectorResponseFromCppToObjC:(void *)a3
{
  if (*(void *)a3) {
    operator new();
  }
  return 0;
}

+ (id)convertMentionResolverResponseFromCppToObjC:(void *)a3
{
  if (*(void *)a3) {
    operator new();
  }
  return 0;
}

+ (unique_ptr<sirinluinternalmention_resolver::MentionResolverRequest,)convertMentionResolverRequestFromObjCToCpp:(id)a3
{
  v5 = v3;
  id v6 = a3;
  if (v6)
  {
    [a1 getCppReaderFromObjCObject:v6];
    operator new();
  }
  void *v5 = 0;

  return v7;
}

+ (unique_ptr<sirinluinternalmention_detector::MentionDetectorRequest,)convertMentionDetectorRequestFromObjCToCpp:(id)a3
{
  v5 = v3;
  id v6 = a3;
  if (v6)
  {
    [a1 getCppReaderFromObjCObject:v6];
    operator new();
  }
  void *v5 = 0;

  return v7;
}

+ (Reader)getCppReaderFromObjCObject:(SEL)a3
{
  id v7 = [a4 data];
  v5 = (const unsigned __int8 *)[v7 bytes];
  [v7 length];
  PB::Reader::Reader((PB::Reader *)retstr, v5);

  return result;
}

@end