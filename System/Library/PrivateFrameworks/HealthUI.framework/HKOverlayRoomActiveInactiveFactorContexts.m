@interface HKOverlayRoomActiveInactiveFactorContexts
- (HKOverlayRoomActiveInactiveFactorContexts)initWithActiveFactorContexts:(id)a3 inactiveFactorContexts:(id)a4;
- (NSArray)activeFactorContexts;
- (NSArray)inactiveFactorContexts;
@end

@implementation HKOverlayRoomActiveInactiveFactorContexts

- (HKOverlayRoomActiveInactiveFactorContexts)initWithActiveFactorContexts:(id)a3 inactiveFactorContexts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKOverlayRoomActiveInactiveFactorContexts;
  v9 = [(HKOverlayRoomActiveInactiveFactorContexts *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activeFactorContexts, a3);
    objc_storeStrong((id *)&v10->_inactiveFactorContexts, a4);
  }

  return v10;
}

- (NSArray)activeFactorContexts
{
  return self->_activeFactorContexts;
}

- (NSArray)inactiveFactorContexts
{
  return self->_inactiveFactorContexts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveFactorContexts, 0);
  objc_storeStrong((id *)&self->_activeFactorContexts, 0);
}

@end