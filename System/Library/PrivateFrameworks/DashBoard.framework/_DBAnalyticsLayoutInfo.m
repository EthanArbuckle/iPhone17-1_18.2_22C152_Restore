@interface _DBAnalyticsLayoutInfo
- (NSString)layoutDisplayName;
- (_DBAnalyticsLayoutInfo)initWithLayout:(id)a3;
- (id)debugDescription;
- (void)startCountingVisibleTime;
- (void)stopCountingVisibleTime;
@end

@implementation _DBAnalyticsLayoutInfo

- (_DBAnalyticsLayoutInfo)initWithLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DBAnalyticsLayoutInfo;
  v6 = [(_DBAnalyticsTimeAccumulator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_layoutDisplayName, a3);
  }

  return v7;
}

- (void)startCountingVisibleTime
{
}

- (void)stopCountingVisibleTime
{
}

- (id)debugDescription
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_DBAnalyticsLayoutInfo;
  v4 = [(_DBAnalyticsLayoutInfo *)&v8 debugDescription];
  id v5 = [(_DBAnalyticsLayoutInfo *)self layoutDisplayName];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSString)layoutDisplayName
{
  return self->_layoutDisplayName;
}

- (void).cxx_destruct
{
}

@end