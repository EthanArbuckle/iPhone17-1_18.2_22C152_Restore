@interface HUSplitRoomTransformedItem
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (HMRoom)room;
- (HUSplitRoomTransformedItem)initWithSourceItem:(id)a3 room:(id)a4;
- (NSString)description;
- (id)_descriptionBuilder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)updateWithOptions:(id)a3;
- (unint64_t)hash;
@end

@implementation HUSplitRoomTransformedItem

- (HUSplitRoomTransformedItem)initWithSourceItem:(id)a3 room:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUSplitRoomTransformedItem;
  v8 = [(HFTransformItem *)&v11 initWithSourceItem:a3 resultKeyExclusionFilter:MEMORY[0x1E4F1CBF0]];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_room, a4);
  }

  return v9;
}

- (id)updateWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(HUSplitRoomTransformedItem *)self room];
  v6 = [v5 uniqueIdentifier];

  v14.receiver = self;
  v14.super_class = (Class)HUSplitRoomTransformedItem;
  id v7 = [(HUSplitRoomTransformedItem *)&v14 updateWithOptions:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__HUSplitRoomTransformedItem_updateWithOptions___block_invoke;
  v11[3] = &unk_1E638CEC0;
  id v12 = v6;
  v13 = self;
  id v8 = v6;
  v9 = [v7 flatMap:v11];

  return v9;
}

id __48__HUSplitRoomTransformedItem_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F68BE8]];
  id v4 = [*(id *)(a1 + 40) sourceItem];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F68BB0]];

  id v7 = (void *)MEMORY[0x1E4F7A0D8];
  id v8 = (void *)[v3 copy];
  v9 = [v7 futureWithResult:v8];

  return v9;
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_3_7 != -1) {
    dispatch_once(&_MergedGlobals_3_7, &__block_literal_global_66_3);
  }
  v2 = (void *)qword_1EA12E0A8;

  return (NAIdentity *)v2;
}

void __41__HUSplitRoomTransformedItem_na_identity__block_invoke_2()
{
  v0 = [MEMORY[0x1E4F7A0E0] builder];
  id v1 = (id)[v0 appendCharacteristic:&__block_literal_global_73];
  id v2 = (id)[v0 appendCharacteristic:&__block_literal_global_75_0];
  uint64_t v3 = [v0 build];

  id v4 = (void *)qword_1EA12E0A8;
  qword_1EA12E0A8 = v3;
}

uint64_t __41__HUSplitRoomTransformedItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 room];
}

uint64_t __41__HUSplitRoomTransformedItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 sourceItem];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [(HFTransformItem *)self sourceItem];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 copyWithZone:a3];
LABEL_5:
    id v7 = (void *)v6;

    v5 = v7;
    goto LABEL_6;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v5 copy];
    goto LABEL_5;
  }
LABEL_6:
  id v8 = objc_alloc((Class)objc_opt_class());
  v9 = [(HUSplitRoomTransformedItem *)self room];
  v10 = (void *)[v8 initWithSourceItem:v5 room:v9];

  [v10 copyLatestResultsFromItem:self];
  return v10;
}

- (id)_descriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F7A0D0] builderWithObject:self];
  id v4 = [(HUSplitRoomTransformedItem *)self room];
  v5 = objc_msgSend(v4, "hf_prettyDescription");
  id v6 = (id)[v3 appendObject:v5 withName:@"room"];

  id v7 = [(HFTransformItem *)self sourceItem];
  id v8 = [v7 description];
  id v9 = (id)[v3 appendObject:v8 withName:@"sourceItem"];

  return v3;
}

- (NSString)description
{
  if ([MEMORY[0x1E4F69758] hasInternalDiagnostics])
  {
    uint64_t v3 = [(HUSplitRoomTransformedItem *)self _descriptionBuilder];
    id v4 = [v3 build];
  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v5);
  }

  return (NSString *)v4;
}

- (HMRoom)room
{
  return self->_room;
}

- (void).cxx_destruct
{
}

@end