@interface APSTopicAttributes
+ (APSTopicAttributes)topicAttributesWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7;
- (APSTopicAttributes)initWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7;
- (BOOL)isCriticalWakeEnabled;
- (BOOL)isDarkWakeEnabled;
- (BOOL)isPushWakeEnabled;
- (BOOL)isUltraConstrainedEnabled;
- (id)description;
- (int64_t)filter;
- (void)setCriticalWakeEnabled:(BOOL)a3;
- (void)setDarkWakeEnabled:(BOOL)a3;
- (void)setPushWakeEnabled:(BOOL)a3;
- (void)setUltraConstrainedEnabled:(BOOL)a3;
@end

@implementation APSTopicAttributes

- (APSTopicAttributes)initWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)APSTopicAttributes;
  result = [(APSTopicAttributes *)&v16 init];
  if (result)
  {
    result->_filter = a3;
    if (v9) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    if (v8) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    if (v7) {
      char v15 = 8;
    }
    else {
      char v15 = 0;
    }
    *((unsigned char *)result + 16) = v13 | a4 | v14 | v15 | *((unsigned char *)result + 16) & 0xF0;
  }
  return result;
}

+ (APSTopicAttributes)topicAttributesWithFilter:(int64_t)a3 darkWakeEnabled:(BOOL)a4 pushWakeEnabled:(BOOL)a5 criticalWakeEnabled:(BOOL)a6 ultraConstrainedEnabled:(BOOL)a7
{
  BOOL v7 = [[APSTopicAttributes alloc] initWithFilter:a3 darkWakeEnabled:a4 pushWakeEnabled:a5 criticalWakeEnabled:a6 ultraConstrainedEnabled:a7];
  return v7;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)APSTopicAttributes;
  uint64_t v3 = [(APSTopicAttributes *)&v13 description];
  v4 = (void *)v3;
  unint64_t filter = self->_filter;
  if (filter > 5) {
    CFStringRef v6 = @"UNKNOWN";
  }
  else {
    CFStringRef v6 = off_10012B6A0[filter];
  }
  if (*((unsigned char *)self + 16)) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if ((*((unsigned char *)self + 16) & 2) != 0) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if ((*((unsigned char *)self + 16) & 4) != 0) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if ((*((unsigned char *)self + 16) & 8) != 0) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = +[NSString stringWithFormat:@"<%@: filter=%@, darkWakeEnabled=%@, pushWakeEnabled=%@, criticalWakeEnabled=%@, ultraConstrainedEnabled=%@>", v3, v6, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isDarkWakeEnabled
{
  return *((unsigned char *)self + 16) & 1;
}

- (void)setDarkWakeEnabled:(BOOL)a3
{
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFE | a3;
}

- (BOOL)isPushWakeEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (void)setPushWakeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v3;
}

- (BOOL)isCriticalWakeEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setCriticalWakeEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v3;
}

- (BOOL)isUltraConstrainedEnabled
{
  return (*((unsigned __int8 *)self + 16) >> 3) & 1;
}

- (void)setUltraConstrainedEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v3;
}

- (int64_t)filter
{
  return self->_filter;
}

@end