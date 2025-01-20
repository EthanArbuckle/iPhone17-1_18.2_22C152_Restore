@interface CPLCloudKitResourceRecordProperties
+ (void)initialize;
@end

@implementation CPLCloudKitResourceRecordProperties

+ (void)initialize
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"CPLResourceRecordPropertiesToEncrypt"];

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    qword_1002C96D8 = (uint64_t)[v3 unsignedIntegerValue];
  }
  _objc_release_x2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprintScheme, 0);
  objc_storeStrong((id *)&self->_recordClass, 0);
  objc_storeStrong((id *)&self->_resourceKeys, 0);
}

@end