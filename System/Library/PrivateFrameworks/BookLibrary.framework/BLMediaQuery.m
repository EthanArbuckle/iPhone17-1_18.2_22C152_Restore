@interface BLMediaQuery
+ (MPMediaQuery)audiobooksNonPreordersQuery;
+ (MPMediaQuery)audiobooksQuery;
@end

@implementation BLMediaQuery

+ (MPMediaQuery)audiobooksQuery
{
  id v2 = sub_21E61B1F8();
  return (MPMediaQuery *)objc_msgSend_audiobooksQuery(v2, v3, v4, v5);
}

+ (MPMediaQuery)audiobooksNonPreordersQuery
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = sub_21E61B1F8();
  v6 = objc_msgSend_audiobooksQuery(v2, v3, v4, v5);
  id v7 = sub_21E61AE44();
  uint64_t v8 = *MEMORY[0x263F11318];
  if ((objc_msgSend_canFilterByProperty_(v7, v9, *MEMORY[0x263F11318], v10) & 1) != 0
    || (id v11 = sub_21E61AF80(), (objc_msgSend_canFilterByProperty_(v11, v12, v8, v13) & 1) != 0))
  {
    id v14 = sub_21E61B0BC();
    v16 = objc_msgSend_predicateWithValue_forProperty_(v14, v15, (uint64_t)&unk_26CF91370, v8);
    objc_msgSend_addFilterPredicate_(v6, v17, (uint64_t)v16, v18);
  }
  else
  {
    v19 = BLDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      int v21 = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_21E616000, v19, OS_LOG_TYPE_ERROR, "MPMediaPropertyPredicate cannot filter using the %@ property.", (uint8_t *)&v21, 0xCu);
    }
  }
  return (MPMediaQuery *)v6;
}

@end