@interface SiriGKAttributionPod
- (SiriGKAttributionPod)initWithPunchOut:(id)a3 usingPersistentStore:(id)a4;
- (id)viewAtIndex:(int64_t)a3;
- (int64_t)keylineType;
- (int64_t)viewCount;
@end

@implementation SiriGKAttributionPod

- (SiriGKAttributionPod)initWithPunchOut:(id)a3 usingPersistentStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SiriGKAttributionPod;
  v8 = [(SiriGKAttributionPod *)&v12 init];
  if (v8)
  {
    v9 = [[SiriGKAttributionView alloc] initWithAppPunchOut:v6 usingPersistentStore:v7];
    attributionView = v8->_attributionView;
    v8->_attributionView = v9;
  }
  return v8;
}

- (int64_t)viewCount
{
  return 1;
}

- (id)viewAtIndex:(int64_t)a3
{
  return self->_attributionView;
}

- (int64_t)keylineType
{
  return 0;
}

- (void).cxx_destruct
{
}

@end