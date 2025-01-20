@interface ASSyncBeginInfo
- (NSSet)reasons;
- (NSString)anchor;
- (NSString)applicationBundleIdentifier;
- (NSString)intentSlotName;
- (NSString)key;
- (NSString)resetValidity;
- (NSString)validity;
- (SASyncAppMetaData)appMetadata;
- (id)description;
- (int64_t)count;
- (void)resetWithValidity:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setAppMetadata:(id)a3;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setIntentSlotName:(id)a3;
- (void)setKey:(id)a3;
- (void)setReasons:(id)a3;
- (void)setResetValidity:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation ASSyncBeginInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetValidity, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_appMetadata, 0);
  objc_storeStrong((id *)&self->_intentSlotName, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_anchor, 0);
}

- (void)setResetValidity:(id)a3
{
}

- (NSString)resetValidity
{
  return self->_resetValidity;
}

- (void)setReasons:(id)a3
{
}

- (NSSet)reasons
{
  return self->_reasons;
}

- (void)setAppMetadata:(id)a3
{
}

- (SASyncAppMetaData)appMetadata
{
  return self->_appMetadata;
}

- (void)setIntentSlotName:(id)a3
{
}

- (NSString)intentSlotName
{
  return self->_intentSlotName;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setValidity:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setAnchor:(id)a3
{
}

- (NSString)anchor
{
  return self->_anchor;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ASSyncBeginInfo;
  v3 = [(ASSyncBeginInfo *)&v7 description];
  v4 = [(ASSyncBeginInfo *)self resetValidity];
  v5 = [v3 stringByAppendingFormat:@" reset validity: %@", v4];

  return v5;
}

- (void)resetWithValidity:(id)a3
{
}

@end