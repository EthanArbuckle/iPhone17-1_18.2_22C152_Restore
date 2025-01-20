@interface HLPLoadInfo
+ (id)infoWithTopicItem:(id)a3 accesstype:(int64_t)a4 searchTerms:(id)a5 anchor:(id)a6;
- (BOOL)analyticsLogged;
- (HLPHelpTopicItem)helpTopicItem;
- (NSArray)searchTerms;
- (NSString)analyticsSourceType;
- (NSString)anchor;
- (id)_initWithTopicItem:(id)a3 accessType:(int64_t)a4 searchTerms:(id)a5 anchor:(id)a6;
- (int64_t)accessType;
- (void)setAnalyticsLogged:(BOOL)a3;
@end

@implementation HLPLoadInfo

- (id)_initWithTopicItem:(id)a3 accessType:(int64_t)a4 searchTerms:(id)a5 anchor:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HLPLoadInfo;
  v14 = [(HLPLoadInfo *)&v17 init];
  p_isa = (id *)&v14->super.isa;
  if (v14)
  {
    v14->_accessType = a4;
    objc_storeStrong((id *)&v14->_helpTopicItem, a3);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
  }

  return p_isa;
}

+ (id)infoWithTopicItem:(id)a3 accesstype:(int64_t)a4 searchTerms:(id)a5 anchor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[objc_alloc((Class)a1) _initWithTopicItem:v12 accessType:a4 searchTerms:v11 anchor:v10];

  return v13;
}

- (NSString)analyticsSourceType
{
  unint64_t v2 = [(HLPLoadInfo *)self accessType];
  if (v2 > 6) {
    v3 = HLPAnalyticsViewSourceTypeUndefined;
  }
  else {
    v3 = off_2645793C0[v2];
  }
  v4 = *v3;
  return (NSString *)v4;
}

- (HLPHelpTopicItem)helpTopicItem
{
  return self->_helpTopicItem;
}

- (int64_t)accessType
{
  return self->_accessType;
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (NSString)anchor
{
  return self->_anchor;
}

- (BOOL)analyticsLogged
{
  return self->_analyticsLogged;
}

- (void)setAnalyticsLogged:(BOOL)a3
{
  self->_analyticsLogged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_helpTopicItem, 0);
}

@end