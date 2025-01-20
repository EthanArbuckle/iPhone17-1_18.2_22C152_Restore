@interface ASDTDeviceInterest
+ (id)createForObject:(id)a3 withInterests:(int)a4;
- (ASDTDeviceInterestProtocol)interested;
- (id)initForObject:(id)a3 withInterests:(int)a4;
- (int)interests;
- (void)notifyOfInterest:(int)a3 forDevice:(id)a4;
- (void)setInterested:(id)a3;
- (void)setInterests:(int)a3;
@end

@implementation ASDTDeviceInterest

- (id)initForObject:(id)a3 withInterests:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTDeviceInterest;
  v7 = [(ASDTDeviceInterest *)&v10 init];
  if (v7)
  {
    if (![v6 conformsToProtocol:&unk_26FCB32B0])
    {
      v8 = 0;
      goto LABEL_6;
    }
    [(ASDTDeviceInterest *)v7 setInterested:v6];
    [(ASDTDeviceInterest *)v7 setInterests:v4];
  }
  v8 = v7;
LABEL_6:

  return v8;
}

+ (id)createForObject:(id)a3 withInterests:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initForObject:v6 withInterests:v4];

  return v7;
}

- (void)notifyOfInterest:(int)a3 forDevice:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  if (v7 && ([(ASDTDeviceInterest *)self interests] & v4) != 0)
  {
    id v6 = [(ASDTDeviceInterest *)self interested];
    [v6 interestNotification:v4 forDevice:v7];
  }
}

- (ASDTDeviceInterestProtocol)interested
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interested);
  return (ASDTDeviceInterestProtocol *)WeakRetained;
}

- (void)setInterested:(id)a3
{
}

- (int)interests
{
  return self->_interests;
}

- (void)setInterests:(int)a3
{
  self->_interests = a3;
}

- (void).cxx_destruct
{
}

@end