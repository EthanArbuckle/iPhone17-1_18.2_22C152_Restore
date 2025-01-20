@interface _GEOInternalResourceManifestUpdateAssertionRecord
- (BOOL)isExpired;
- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5;
- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithReason:(id)a3;
- (id)description;
@end

@implementation _GEOInternalResourceManifestUpdateAssertionRecord

- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithProcess:(id)a3 reason:(id)a4 creationTimestamp:(double)a5
{
  return -[_GEOInternalResourceManifestUpdateAssertionRecord initWithReason:](self, "initWithReason:", a4, a5);
}

- (_GEOInternalResourceManifestUpdateAssertionRecord)initWithReason:(id)a3
{
  id v4 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v8.receiver = self;
  v8.super_class = (Class)_GEOInternalResourceManifestUpdateAssertionRecord;
  v6 = [(_GEOResourceManifestUpdateAssertionRecord *)&v8 initWithProcess:@"geod" reason:v4 creationTimestamp:Current];

  return v6;
}

- (BOOL)isExpired
{
  return 0;
}

- (id)description
{
  v5.receiver = self;
  v5.super_class = (Class)_GEOInternalResourceManifestUpdateAssertionRecord;
  v2 = [(_GEOResourceManifestUpdateAssertionRecord *)&v5 description];
  v3 = [v2 stringByAppendingString:@" (internal)"];

  return v3;
}

@end