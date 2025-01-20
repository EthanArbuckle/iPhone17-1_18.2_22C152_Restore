@interface GSLibraryState
+ (BOOL)supportsSecureCoding;
- (BOOL)isClean;
- (GSLibraryState)init;
- (GSLibraryState)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
@end

@implementation GSLibraryState

- (GSLibraryState)init
{
  v3.receiver = self;
  v3.super_class = (Class)GSLibraryState;
  result = [(GSLibraryState *)&v3 init];
  if (result) {
    result->state = 2;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<state:%d, lastFeatureSet:%d, fseventid:%lld>", self->state, self->lastFeatureSet, self->fseventID];
}

- (GSLibraryState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GSLibraryState;
  v5 = [(GSLibraryState *)&v7 init];
  if (v5)
  {
    v5->state = [v4 decodeIntForKey:@"state"];
    v5->lastFeatureSet = [v4 decodeIntForKey:@"lastFeatureSet"];
    v5->fseventID = (unint64_t)[v4 decodeInt64ForKey:@"fseventID"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->state;
  id v5 = a3;
  [v5 encodeInt:state forKey:@"state"];
  [v5 encodeInt:self->lastFeatureSet forKey:@"lastFeatureSet"];
  [v5 encodeInt64:self->fseventID forKey:@"fseventID"];
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  sqlite3_bind_blob(a3, a4, [v6 bytes], (int)objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)isClean
{
  return !self->state && self->lastFeatureSet > 3;
}

@end