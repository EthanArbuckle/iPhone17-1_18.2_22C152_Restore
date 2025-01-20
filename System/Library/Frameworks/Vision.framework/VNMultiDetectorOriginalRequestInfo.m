@interface VNMultiDetectorOriginalRequestInfo
+ (NSDictionary)originatingRequestSpecifierToDetectorClassMap;
+ (id)requestClassNameFromRequestKey:(id)a3;
+ (id)requestKeyFromRequest:(id)a3;
- (NSString)originatingRequestSpecifierKey;
- (VNMultiDetectorOriginalRequestInfo)initWithOriginatingRequestSpecifierProcessingOptionKey:(id)a3 originalRequestResultsIndex:(unint64_t)a4;
- (id)description;
- (unint64_t)originalRequestResultsIndex;
@end

@implementation VNMultiDetectorOriginalRequestInfo

- (NSString)originatingRequestSpecifierKey
{
  return self->_originatingRequestSpecifierKey;
}

+ (id)requestKeyFromRequest:(id)a3
{
  id v3 = a3;
  v4 = NSStringFromClass((Class)[v3 frameworkClass]);

  return v4;
}

- (void).cxx_destruct
{
}

- (unint64_t)originalRequestResultsIndex
{
  return self->_originalRequestResultsIndex;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"%@; resultsIndex=%lu",
                 self->_originatingRequestSpecifierKey,
                 self->_originalRequestResultsIndex);

  return v2;
}

- (VNMultiDetectorOriginalRequestInfo)initWithOriginatingRequestSpecifierProcessingOptionKey:(id)a3 originalRequestResultsIndex:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VNMultiDetectorOriginalRequestInfo;
  v7 = [(VNMultiDetectorOriginalRequestInfo *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    originatingRequestSpecifierKey = v7->_originatingRequestSpecifierKey;
    v7->_originatingRequestSpecifierKey = (NSString *)v8;

    v7->_originalRequestResultsIndex = a4;
    v10 = v7;
  }

  return v7;
}

+ (id)requestClassNameFromRequestKey:(id)a3
{
  id v3 = a3;

  return v3;
}

+ (NSDictionary)originatingRequestSpecifierToDetectorClassMap
{
  return 0;
}

@end