@interface EDAMClientUsageMetrics
+ (id)structFields;
+ (id)structName;
- (NSNumber)sessions;
- (NSString)subjectConsumerKey;
- (NSString)subjectConsumerSecret;
- (void)setSessions:(id)a3;
- (void)setSubjectConsumerKey:(id)a3;
- (void)setSubjectConsumerSecret:(id)a3;
@end

@implementation EDAMClientUsageMetrics

+ (id)structFields
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_1038;
  if (!structFields_structFields_1038)
  {
    v3 = +[FATField fieldWithIndex:1 type:8 optional:1 name:@"sessions"];
    v4 = +[FATField fieldWithIndex:2, 11, 1, @"subjectConsumerKey", v3 type optional name];
    v9[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:1 name:@"subjectConsumerSecret"];
    v9[2] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
    v7 = (void *)structFields_structFields_1038;
    structFields_structFields_1038 = v6;

    v2 = (void *)structFields_structFields_1038;
  }
  return v2;
}

+ (id)structName
{
  return @"ClientUsageMetrics";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectConsumerSecret, 0);
  objc_storeStrong((id *)&self->_subjectConsumerKey, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

- (void)setSubjectConsumerSecret:(id)a3
{
}

- (NSString)subjectConsumerSecret
{
  return self->_subjectConsumerSecret;
}

- (void)setSubjectConsumerKey:(id)a3
{
}

- (NSString)subjectConsumerKey
{
  return self->_subjectConsumerKey;
}

- (void)setSessions:(id)a3
{
}

- (NSNumber)sessions
{
  return self->_sessions;
}

@end