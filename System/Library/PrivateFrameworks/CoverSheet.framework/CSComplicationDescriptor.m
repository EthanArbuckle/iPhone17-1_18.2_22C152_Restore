@interface CSComplicationDescriptor
- (BOOL)isBlockedForScreenTimeExpiration;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (CHSWidgetMetrics)metrics;
- (CSComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 blockedForScreenTimeExpiration:(BOOL)a6;
- (NSString)uniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptorBlockedForScreenTimeExpiration:(BOOL)a3;
@end

@implementation CSComplicationDescriptor

- (CSComplicationDescriptor)initWithUniqueIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5 blockedForScreenTimeExpiration:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSComplicationDescriptor;
  v14 = [(CSComplicationDescriptor *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_uniqueIdentifier, a3);
    objc_storeStrong((id *)&v15->_widget, a4);
    objc_storeStrong((id *)&v15->_metrics, a5);
    v15->_blockedForScreenTimeExpiration = a6;
  }

  return v15;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v3 appendString:self->_uniqueIdentifier withName:@"uniqueIdentifier" skipIfEmpty:1];
  id v4 = (id)[v3 appendObject:self->_widget withName:@"widget" skipIfNil:1];
  v5 = [v3 build];

  return v5;
}

- (id)descriptorBlockedForScreenTimeExpiration:(BOOL)a3
{
  v3 = [[CSComplicationDescriptor alloc] initWithUniqueIdentifier:self->_uniqueIdentifier widget:self->_widget metrics:self->_metrics blockedForScreenTimeExpiration:a3];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:self ofExpectedClass:objc_opt_class()];
  uniqueIdentifier = self->_uniqueIdentifier;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __36__CSComplicationDescriptor_isEqual___block_invoke;
  v28[3] = &unk_1E6ADA3B8;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendString:uniqueIdentifier counterpart:v28];
  widget = self->_widget;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__CSComplicationDescriptor_isEqual___block_invoke_2;
  v26[3] = &unk_1E6ADA3E0;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendObject:widget counterpart:v26];
  metrics = self->_metrics;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __36__CSComplicationDescriptor_isEqual___block_invoke_3;
  v24[3] = &unk_1E6ADA408;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendObject:metrics counterpart:v24];
  uint64_t blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __36__CSComplicationDescriptor_isEqual___block_invoke_4;
  v22 = &unk_1E6ADA430;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendBool:blockedForScreenTimeExpiration counterpart:&v19];
  LOBYTE(blockedForScreenTimeExpiration) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return blockedForScreenTimeExpiration;
}

id __36__CSComplicationDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __36__CSComplicationDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __36__CSComplicationDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

uint64_t __36__CSComplicationDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uniqueIdentifier = self->_uniqueIdentifier;
  widget = self->_widget;
  metrics = self->_metrics;
  BOOL blockedForScreenTimeExpiration = self->_blockedForScreenTimeExpiration;

  return (id)[v4 initWithUniqueIdentifier:uniqueIdentifier widget:widget metrics:metrics blockedForScreenTimeExpiration:blockedForScreenTimeExpiration];
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isBlockedForScreenTimeExpiration
{
  return self->_blockedForScreenTimeExpiration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end