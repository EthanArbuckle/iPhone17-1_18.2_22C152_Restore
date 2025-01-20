@interface ACCAppLinksAccessory
- (ACCAppLinksAccessory)initWithUUID:(id)a3 categories:(id)a4 iconSize:(unsigned __int16)a5 certSerial:(id)a6 withState:(id)a7;
- (BOOL)initialUpdateSent;
- (BOOL)listUpdateFailedToSend;
- (NSData)certSerial;
- (NSNumber)subFeatureState;
- (NSSet)categories;
- (NSString)uuid;
- (OS_dispatch_source)carPlayRetryUpdateTimer;
- (unsigned)iconSize;
- (void)dealloc;
- (void)setCarPlayRetryUpdateTimer:(id)a3;
- (void)setCategories:(id)a3;
- (void)setCertSerial:(id)a3;
- (void)setIconSize:(unsigned __int16)a3;
- (void)setInitialUpdateSent:(BOOL)a3;
- (void)setListUpdateFailedToSend:(BOOL)a3;
- (void)setSubFeatureState:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation ACCAppLinksAccessory

- (ACCAppLinksAccessory)initWithUUID:(id)a3 categories:(id)a4 iconSize:(unsigned __int16)a5 certSerial:(id)a6 withState:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)ACCAppLinksAccessory;
  v17 = [(ACCAppLinksAccessory *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_categories, a4);
    v18->_iconSize = a5;
    v19 = (NSData *)[v15 copy];
    certSerial = v18->_certSerial;
    v18->_certSerial = v19;

    objc_storeStrong((id *)&v18->_subFeatureState, a7);
    *(_WORD *)&v18->_initialUpdateSent = 0;
    carPlayRetryUpdateTimer = v18->_carPlayRetryUpdateTimer;
    v18->_carPlayRetryUpdateTimer = 0;
  }
  return v18;
}

- (void)dealloc
{
  [(ACCAppLinksAccessory *)self setUuid:0];
  [(ACCAppLinksAccessory *)self setCategories:0];
  [(ACCAppLinksAccessory *)self setCertSerial:0];
  [(ACCAppLinksAccessory *)self setSubFeatureState:0];
  v3 = [(ACCAppLinksAccessory *)self carPlayRetryUpdateTimer];

  if (v3)
  {
    v4 = [(ACCAppLinksAccessory *)self carPlayRetryUpdateTimer];
    dispatch_source_cancel(v4);

    [(ACCAppLinksAccessory *)self setCarPlayRetryUpdateTimer:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)ACCAppLinksAccessory;
  [(ACCAppLinksAccessory *)&v5 dealloc];
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSSet)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (unsigned)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(unsigned __int16)a3
{
  self->_iconSize = a3;
}

- (NSData)certSerial
{
  return self->_certSerial;
}

- (void)setCertSerial:(id)a3
{
}

- (NSNumber)subFeatureState
{
  return self->_subFeatureState;
}

- (void)setSubFeatureState:(id)a3
{
}

- (BOOL)initialUpdateSent
{
  return self->_initialUpdateSent;
}

- (void)setInitialUpdateSent:(BOOL)a3
{
  self->_initialUpdateSent = a3;
}

- (BOOL)listUpdateFailedToSend
{
  return self->_listUpdateFailedToSend;
}

- (void)setListUpdateFailedToSend:(BOOL)a3
{
  self->_listUpdateFailedToSend = a3;
}

- (OS_dispatch_source)carPlayRetryUpdateTimer
{
  return self->_carPlayRetryUpdateTimer;
}

- (void)setCarPlayRetryUpdateTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carPlayRetryUpdateTimer, 0);
  objc_storeStrong((id *)&self->_subFeatureState, 0);
  objc_storeStrong((id *)&self->_certSerial, 0);
  objc_storeStrong((id *)&self->_categories, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end