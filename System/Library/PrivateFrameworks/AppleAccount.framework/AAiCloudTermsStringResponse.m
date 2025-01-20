@interface AAiCloudTermsStringResponse
- (NSString)termsString;
@end

@implementation AAiCloudTermsStringResponse

- (NSString)termsString
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->super._responseTermsDictionary objectForKey:@"iCloud"];
  v3 = _AALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    v6 = v2;
    _os_log_impl(&dword_1A11D8000, v3, OS_LOG_TYPE_DEFAULT, "Got terms string: %@", (uint8_t *)&v5, 0xCu);
  }

  return (NSString *)v2;
}

@end