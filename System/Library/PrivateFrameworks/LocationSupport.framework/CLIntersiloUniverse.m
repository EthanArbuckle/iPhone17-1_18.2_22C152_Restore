@interface CLIntersiloUniverse
+ (id)newIsolatedUniverseWithOnlySilo:(id)a3;
+ (id)newSharedVendorUniverseWithSilo:(id)a3;
- (CLIntersiloUniverse)initWithSilo:(id)a3 vendor:(id)a4;
- (CLServiceVendor)vendor;
- (CLSilo)silo;
@end

@implementation CLIntersiloUniverse

- (CLServiceVendor)vendor
{
  return self->_vendor;
}

+ (id)newIsolatedUniverseWithOnlySilo:(id)a3
{
  id v3 = a3;
  v4 = [CLIntersiloUniverse alloc];
  id v5 = objc_alloc(MEMORY[0x1E4F28FB0]);
  v6 = [(CLIntersiloUniverse *)v4 initWithSilo:v3 vendor:v5];

  return v6;
}

+ (id)newSharedVendorUniverseWithSilo:(id)a3
{
  id v3 = a3;
  v4 = [CLIntersiloUniverse alloc];
  id v5 = +[CLServiceVendor sharedInstance];
  v6 = [(CLIntersiloUniverse *)v4 initWithSilo:v3 vendor:v5];

  return v6;
}

- (CLIntersiloUniverse)initWithSilo:(id)a3 vendor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CLIntersiloUniverse;
  v9 = [(CLIntersiloUniverse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_silo, a3);
    objc_storeStrong((id *)&v10->_vendor, a4);
  }

  return v10;
}

- (CLSilo)silo
{
  return self->_silo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
}

@end