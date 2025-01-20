@interface LSRegistrationInfo
+ (BOOL)supportsSecureCoding;
- (LSRegistrationInfo)initWithCoder:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSRegistrationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version = self->version;
  id v5 = a3;
  [v5 encodeInt64:version forKey:@"version"];
  [v5 encodeInt64:self->action forKey:@"action"];
  [v5 encodeInt64:self->options forKey:@"options"];
  [v5 encodeInt64:self->itemFlags forKey:@"itemFlags"];
  [v5 encodeInt64:self->containerUnit forKey:@"containerUnit"];
  [v5 encodeInt64:self->bundleUnit forKey:@"bundleUnit"];
  [v5 encodeInt64:self->bundleClass forKey:@"bundleClass"];
  [v5 encodeInt64:self->inoBundle forKey:@"inoBundle"];
  [v5 encodeInt64:self->inoExec forKey:@"inoExec"];
  [v5 encodeDouble:@"contentModDate" forKey:self->contentModDate];
  [v5 encodeDouble:@"execContentModDate" forKey:self->executableModDate];
}

- (LSRegistrationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LSRegistrationInfo *)self init];
  if (v5)
  {
    v5->uint64_t version = [v4 decodeInt64ForKey:@"version"];
    v5->action = [v4 decodeInt64ForKey:@"action"];
    v5->options = [v4 decodeInt64ForKey:@"options"];
    v5->itemFlags = [v4 decodeInt64ForKey:@"itemFlags"];
    v5->containerUnit = [v4 decodeInt64ForKey:@"containerUnit"];
    v5->bundleUnit = [v4 decodeInt64ForKey:@"bundleUnit"];
    v5->bundleClass = [v4 decodeInt64ForKey:@"bundleClass"];
    v5->inoBundle = [v4 decodeInt64ForKey:@"inoBundle"];
    v5->inoExec = [v4 decodeInt64ForKey:@"inoExec"];
    [v4 decodeDoubleForKey:@"contentModDate"];
    v5->contentModDate = v6;
    [v4 decodeDoubleForKey:@"execContentModDate"];
    v5->executableModDate = v7;
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((_DWORD *)result + 2) = self->version;
    *((_DWORD *)result + 3) = self->action;
    *((_DWORD *)result + 4) = self->options;
    *((_DWORD *)result + 5) = self->itemFlags;
    *((_DWORD *)result + 6) = self->containerUnit;
    *((_DWORD *)result + 7) = self->bundleUnit;
    *((_DWORD *)result + 8) = self->bundleClass;
    *((void *)result + 5) = self->inoBundle;
    *((void *)result + 6) = self->inoExec;
    *((void *)result + 7) = *(void *)&self->contentModDate;
    *((void *)result + 8) = *(void *)&self->executableModDate;
  }
  return result;
}

@end