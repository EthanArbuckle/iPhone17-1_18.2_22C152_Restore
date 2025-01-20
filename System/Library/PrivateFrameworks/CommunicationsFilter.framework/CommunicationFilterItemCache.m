@interface CommunicationFilterItemCache
- (BOOL)matchesItem:(id)a3;
- (CommunicationFilterItemCache)initWithFilterItem:(id)a3 isInList:(int64_t)a4;
- (int64_t)isInList;
- (void)setIsInList:(int64_t)a3;
@end

@implementation CommunicationFilterItemCache

- (CommunicationFilterItemCache)initWithFilterItem:(id)a3 isInList:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CommunicationFilterItemCache;
  v8 = [(CommunicationFilterItemCache *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_filterItem, a3);
    v9->_isInList = a4;
  }

  return v9;
}

- (BOOL)matchesItem:(id)a3
{
  return [(CommunicationFilterItem *)self->_filterItem matchesFilterItem:a3];
}

- (int64_t)isInList
{
  return self->_isInList;
}

- (void)setIsInList:(int64_t)a3
{
  self->_isInList = a3;
}

- (void).cxx_destruct
{
}

@end