@interface HUServiceDetailsRoomItem
- (HFServiceLikeBuilder)serviceLikeBuilder;
- (HUServiceDetailsRoomItem)initWithSourceServiceItem:(id)a3 home:(id)a4 serviceLikeBuilder:(id)a5;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HUServiceDetailsRoomItem

- (HUServiceDetailsRoomItem)initWithSourceServiceItem:(id)a3 home:(id)a4 serviceLikeBuilder:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUServiceDetailsRoomItem;
  v10 = [(HUServiceDetailsAbstractItem *)&v13 initWithSourceServiceItem:a3 home:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_serviceLikeBuilder, a5);
  }

  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v4 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v5 = [v4 homeKitObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 services];
    if (!v6)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v7 = (void *)MEMORY[0x1E4F2EA88];
    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    uint64_t v9 = objc_msgSend(v7, "hf_roomsForServices:", v8);
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_7:
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_msgSend(v5, "hf_parentRoom");
LABEL_8:
    v6 = (void *)v12;
    v10 = objc_msgSend(v11, "na_setWithSafeObject:", v12);
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = [v5 room];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35 = (void *)MEMORY[0x1E4F1CAD0];
    v6 = [v5 accessory];
    v8 = [v6 room];
    uint64_t v9 = objc_msgSend(v35, "na_setWithSafeObject:", v8);
LABEL_5:
    v10 = (void *)v9;

LABEL_9:
    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:
  objc_super v13 = [MEMORY[0x1E4F1CA60] dictionary];
  v14 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v15 = [v14 latestResults];
  uint64_t v16 = *MEMORY[0x1E4F68908];
  v17 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68908]];
  v18 = (void *)[v17 mutableCopy];

  if (v10) {
    [v18 unionSet:v10];
  }
  [v13 setObject:v18 forKeyedSubscript:v16];
  v19 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsRoomTitle", @"HUServiceDetailsRoomTitle", 1);
  [v13 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F68AB8]];

  v20 = [NSString stringWithFormat:@"AccessoryDetails.Room"];
  [v13 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F68928]];

  v21 = [(HUServiceDetailsRoomItem *)self serviceLikeBuilder];
  v22 = [v21 room];
  v23 = [v22 name];

  if (v23 && [v23 length])
  {
    objc_msgSend(v13, "na_safeSetObject:forKey:", v23, *MEMORY[0x1E4F68980]);
  }
  else if ([v10 count] == 1)
  {
    v24 = [v10 anyObject];
    v25 = [v24 name];
    v26 = (void *)[v25 copy];

    objc_msgSend(v13, "na_safeSetObject:forKey:", v26, *MEMORY[0x1E4F68980]);
  }
  else if ((unint64_t)[v10 count] >= 2)
  {
    v27 = _HULocalizedStringWithDefaultValue(@"HUServiceDetailsMultipleRooms", @"HUServiceDetailsMultipleRooms", 1);
    [v13 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F68980]];
  }
  v28 = [(HUServiceDetailsAbstractItem *)self sourceServiceItem];
  v29 = [v28 latestResults];
  v30 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F68CA0]];
  objc_msgSend(v13, "na_safeSetObject:forKey:", v30, *MEMORY[0x1E4F68A08]);

  [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68A70]];
  if ([(HUServiceDetailsAbstractItem *)self isContainedInAParent]
    && [(HUServiceDetailsAbstractItem *)self canShowAsIndividualTiles]
    && ![(HUServiceDetailsAbstractItem *)self isSensorService])
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(HUServiceDetailsAbstractItem *)self isAccessoryDisplayedAsIndividualTiles])
  {
    [v13 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F68B10]];
  }
  v31 = (void *)MEMORY[0x1E4F7A0D8];
  v32 = [MEMORY[0x1E4F69228] outcomeWithResults:v13];
  v33 = [v31 futureWithResult:v32];

  return v33;
}

- (HFServiceLikeBuilder)serviceLikeBuilder
{
  return self->_serviceLikeBuilder;
}

- (void).cxx_destruct
{
}

@end