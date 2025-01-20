@interface CNContactVCardParsedResultBuilder
+ (id)contactKeyForVCardKey:(id)a3;
+ (id)contactValueTransformForVCardKey:(id)a3;
+ (id)labeledValuesWithValues:(id)a3 transform:(id)a4 labels:(id)a5 isPrimaries:(id)a6;
+ (id)os_log;
- (BOOL)canSetValueForProperty:(id)a3;
- (BOOL)setImageData:(id)a3 forReference:(id)a4 clipRects:(id)a5;
- (BOOL)setPersonFlags:(int64_t)a3;
- (BOOL)setValue:(id)a3 forProperty:(id)a4;
- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6;
- (CNContactVCardParsedResultBuilder)init;
- (id)build;
- (id)validCountryCodes;
- (id)valueForProperty:(id)a3;
- (int64_t)contactTypeFromPersonFlags:(int64_t)a3;
- (int64_t)personFlags;
- (int64_t)sharedPhotoDisplayPreferenceFromPersonFlags:(int64_t)a3;
- (unint64_t)personFlagsByAddingContactType:(int64_t)a3 toFlags:(unint64_t)a4;
- (unint64_t)personFlagsByAddingSharedPhotoDisplayPreference:(int64_t)a3 toFlags:(unint64_t)a4;
@end

@implementation CNContactVCardParsedResultBuilder

+ (id)contactKeyForVCardKey:(id)a3
{
  uint64_t v3 = contactKeyForVCardKey__cn_once_token_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&contactKeyForVCardKey__cn_once_token_0, &__block_literal_global_16);
  }
  v5 = [(id)contactKeyForVCardKey__cn_once_object_0 objectForKeyedSubscript:v4];

  return v5;
}

void __59__CNContactVCardParsedResultBuilder_contactKeyForVCardKey___block_invoke()
{
  v22[37] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB8A98];
  v21[0] = *MEMORY[0x1E4FB8A48];
  v21[1] = v0;
  v22[0] = @"givenName";
  v22[1] = @"middleName";
  uint64_t v1 = *MEMORY[0x1E4FB8AA8];
  v21[2] = *MEMORY[0x1E4FB8A80];
  v21[3] = v1;
  v22[2] = @"familyName";
  v22[3] = @"namePrefix";
  uint64_t v2 = *MEMORY[0x1E4FB8AB0];
  v21[4] = *MEMORY[0x1E4FB8AA0];
  v21[5] = v2;
  v22[4] = @"nameSuffix";
  v22[5] = @"nickname";
  uint64_t v3 = *MEMORY[0x1E4FB8AD8];
  v21[6] = *MEMORY[0x1E4FB8A88];
  v21[7] = v3;
  v22[6] = @"previousFamilyName";
  v22[7] = @"phoneticGivenName";
  uint64_t v4 = *MEMORY[0x1E4FB8AE0];
  v21[8] = *MEMORY[0x1E4FB8AE8];
  v21[9] = v4;
  v22[8] = @"phoneticMiddleName";
  v22[9] = @"phoneticFamilyName";
  uint64_t v5 = *MEMORY[0x1E4FB8B10];
  v21[10] = *MEMORY[0x1E4FB8B08];
  v21[11] = v5;
  v22[10] = @"pronunciationGivenName";
  v22[11] = @"pronunciationFamilyName";
  uint64_t v6 = *MEMORY[0x1E4FB8AC0];
  v21[12] = *MEMORY[0x1E4FB8A20];
  v21[13] = v6;
  v22[12] = @"addressingGrammars";
  v22[13] = @"organizationName";
  uint64_t v7 = *MEMORY[0x1E4FB8A78];
  v21[14] = *MEMORY[0x1E4FB8A38];
  v21[15] = v7;
  v22[14] = @"departmentName";
  v22[15] = @"jobTitle";
  uint64_t v8 = *MEMORY[0x1E4FB8A28];
  v21[16] = *MEMORY[0x1E4FB8A30];
  v21[17] = v8;
  v22[16] = @"birthday";
  v22[17] = @"nonGregorianBirthday";
  uint64_t v9 = *MEMORY[0x1E4FB8A40];
  v21[18] = *MEMORY[0x1E4FB8AD0];
  v21[19] = v9;
  v22[18] = @"phoneNumbers";
  v22[19] = @"emailAddresses";
  uint64_t v10 = *MEMORY[0x1E4FB8B28];
  v21[20] = *MEMORY[0x1E4FB8AF0];
  v21[21] = v10;
  v22[20] = @"postalAddresses";
  v22[21] = @"socialProfiles";
  uint64_t v11 = *MEMORY[0x1E4FB8B30];
  v21[22] = *MEMORY[0x1E4FB8A70];
  v21[23] = v11;
  v22[22] = @"instantMessageAddresses";
  v22[23] = @"urlAddresses";
  uint64_t v12 = *MEMORY[0x1E4FB8AC8];
  v21[24] = *MEMORY[0x1E4FB8B18];
  v21[25] = v12;
  v22[24] = @"contactRelations";
  v22[25] = @"dates";
  uint64_t v13 = *MEMORY[0x1E4FB8AF8];
  v21[26] = *MEMORY[0x1E4FB8B00];
  v21[27] = v13;
  v22[26] = @"preferredLikenessSource";
  v22[27] = @"preferredApplePersonaIdentifier";
  uint64_t v14 = *MEMORY[0x1E4FB8AB8];
  v21[28] = *MEMORY[0x1E4FB8A50];
  v21[29] = v14;
  v22[28] = @"downtimeWhitelist";
  v22[29] = @"note";
  uint64_t v15 = *MEMORY[0x1E4FB8A60];
  v21[30] = *MEMORY[0x1E4FB8A68];
  v21[31] = v15;
  v22[30] = @"imageType";
  v22[31] = @"imageHash";
  uint64_t v16 = *MEMORY[0x1E4FB8B38];
  v21[32] = *MEMORY[0x1E4FB8A90];
  v21[33] = v16;
  v22[32] = @"memojiMetadata";
  v22[33] = @"wallpaper";
  uint64_t v17 = *MEMORY[0x1E4FB8B20];
  v21[34] = *MEMORY[0x1E4FB8B40];
  v21[35] = v17;
  v22[34] = @"watchWallpaperImageData";
  v22[35] = @"sharedPhotoDisplayPreference";
  v21[36] = *MEMORY[0x1E4FB8A58];
  v22[36] = @"imageBackgroundColorsData";
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:37];
  uint64_t v19 = [v18 copy];
  v20 = (void *)contactKeyForVCardKey__cn_once_object_0;
  contactKeyForVCardKey__cn_once_object_0 = v19;
}

+ (id)contactValueTransformForVCardKey:(id)a3
{
  id v3 = a3;
  if (contactValueTransformForVCardKey__cn_once_token_1 != -1) {
    dispatch_once(&contactValueTransformForVCardKey__cn_once_token_1, &__block_literal_global_2);
  }
  uint64_t v4 = [(id)contactValueTransformForVCardKey__cn_once_object_1 objectForKeyedSubscript:v3];
  if (!v4) {
    uint64_t v4 = _Block_copy((const void *)*MEMORY[0x1E4F5A248]);
  }
  uint64_t v5 = _Block_copy(v4);

  return v5;
}

void __70__CNContactVCardParsedResultBuilder_contactValueTransformForVCardKey___block_invoke()
{
  v10[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB8B28];
  v9[0] = *MEMORY[0x1E4FB8AF0];
  v9[1] = v0;
  v10[0] = &__block_literal_global_6_0;
  v10[1] = &__block_literal_global_10;
  v10[2] = &__block_literal_global_13;
  uint64_t v1 = *MEMORY[0x1E4FB8AD0];
  v9[2] = *MEMORY[0x1E4FB8A70];
  v9[3] = v1;
  uint64_t v2 = +[CN phoneNumberFromStringTransform];
  v10[3] = v2;
  v9[4] = *MEMORY[0x1E4FB8B18];
  id v3 = +[CN relatedContactFromStringTransform];
  v10[4] = v3;
  v9[5] = *MEMORY[0x1E4FB8A20];
  uint64_t v4 = +[CN addressingGrammarFromStringTransform];
  v10[5] = v4;
  v9[6] = *MEMORY[0x1E4FB8B38];
  uint64_t v5 = +[CN wallpaperFromDataTransform];
  v10[6] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:7];
  uint64_t v7 = [v6 copy];
  uint64_t v8 = (void *)contactValueTransformForVCardKey__cn_once_object_1;
  contactValueTransformForVCardKey__cn_once_object_1 = v7;
}

- (CNContactVCardParsedResultBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNContactVCardParsedResultBuilder;
  uint64_t v2 = [(CNContactVCardParsedResultBuilder *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(CNMutableContact);
    contact = v2->_contact;
    v2->_contact = v3;

    v2->_empty = 1;
    uint64_t v5 = v2;
  }

  return v2;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2_0 != -1) {
    dispatch_once(&os_log_cn_once_token_2_0, &__block_literal_global_16);
  }
  uint64_t v2 = (void *)os_log_cn_once_object_2_0;

  return v2;
}

uint64_t __43__CNContactVCardParsedResultBuilder_os_log__block_invoke()
{
  os_log_cn_once_object_2_0 = (uint64_t)os_log_create("com.apple.contacts.vcard", "parser");

  return MEMORY[0x1F41817F8]();
}

- (id)build
{
  if (self->_empty) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = (void *)[(CNMutableContact *)self->_contact copy];
  }

  return v2;
}

- (id)valueForProperty:(id)a3
{
  if ([a3 isEqual:*MEMORY[0x1E4FB8A18]])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNContactVCardParsedResultBuilder personFlags](self, "personFlags"));
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)canSetValueForProperty:(id)a3
{
  return 1;
}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() contactKeyForVCardKey:v7];
  uint64_t v9 = (void *)MEMORY[0x1E4FB8A18];
  if (v8 || ([v7 isEqual:*MEMORY[0x1E4FB8A18]] & 1) != 0)
  {
    if (v6) {
      self->_empty = 0;
    }
    if ([v7 isEqual:*v9])
    {
      -[CNContactVCardParsedResultBuilder setPersonFlags:](self, "setPersonFlags:", [v6 integerValue]);
    }
    else
    {
      uint64_t v10 = [(id)objc_opt_class() contactValueTransformForVCardKey:v7];
      uint64_t v11 = (void *)v10;
      if (v10)
      {
        uint64_t v12 = (*(void (**)(uint64_t, id))(v10 + 16))(v10, v6);

        id v6 = (id)v12;
      }
      [(CNMutableContact *)self->_contact setValue:v6 forKey:v8];
    }
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v15 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v7;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEFAULT, "Not sure how to handle '%@': %@", (uint8_t *)&v16, 0x16u);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)setValues:(id)a3 labels:(id)a4 isPrimaries:(id)a5 forProperty:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(id)objc_opt_class() contactKeyForVCardKey:v13];
  if (v14)
  {
    if ([v10 count]) {
      self->_empty = 0;
    }
    uint64_t v15 = [(id)objc_opt_class() contactValueTransformForVCardKey:v13];
    int v16 = [(id)objc_opt_class() labeledValuesWithValues:v10 transform:v15 labels:v11 isPrimaries:v12];
    [(CNMutableContact *)self->_contact setValue:v16 forKey:v14];
  }
  else
  {
    id v17 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412546;
      id v20 = v13;
      __int16 v21 = 2112;
      id v22 = v10;
      _os_log_impl(&dword_1909E3000, v17, OS_LOG_TYPE_DEFAULT, "Not sure how to handle '%@': %@", (uint8_t *)&v19, 0x16u);
    }
  }
  return v14 != 0;
}

+ (id)labeledValuesWithValues:(id)a3 transform:(id)a4 labels:(id)a5 isPrimaries:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (void (**)(id, NSObject *))a4;
  id v26 = a5;
  id v25 = a6;
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  if ([v9 count])
  {
    unint64_t v14 = 0;
    *(void *)&long long v13 = 138412290;
    long long v24 = v13;
    do
    {
      uint64_t v15 = objc_msgSend(v9, "objectAtIndexedSubscript:", v14, v24);
      if (v10
        && (v10[2](v10, v15),
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            v15,
            (uint64_t v15 = v16) == 0))
      {
        uint64_t v15 = objc_msgSend((id)objc_opt_class(), "os_log");
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_11;
        }
        id v17 = [v9 objectAtIndexedSubscript:v14];
        *(_DWORD *)buf = v24;
        v28 = v17;
        _os_log_debug_impl(&dword_1909E3000, v15, OS_LOG_TYPE_DEBUG, "Got nil when transforming from vcard value:%@", buf, 0xCu);
      }
      else
      {
        id v17 = [v26 objectAtIndexedSubscript:v14];
        __int16 v18 = [[CNLabeledValue alloc] initWithLabel:v17 value:v15];
        int v19 = [v25 objectAtIndexedSubscript:v14];
        int v20 = [v19 BOOLValue];

        if (v20) {
          __int16 v21 = v11;
        }
        else {
          __int16 v21 = v12;
        }
        [v21 addObject:v18];
      }
LABEL_11:

      ++v14;
    }
    while (v14 < [v9 count]);
  }
  id v22 = (void *)[v11 mutableCopy];
  [v22 addObjectsFromArray:v12];

  return v22;
}

- (BOOL)setImageData:(id)a3 forReference:(id)a4 clipRects:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 length])
  {
    self->_empty = 0;
    [(CNMutableContact *)self->_contact setImageData:v8];
    id v11 = [v10 firstObject];
    id v12 = [v11 objectForKeyedSubscript:@"kABImageInfoClipRectKey"];
    long long v13 = v12;
    if (v12)
    {
      [v12 rectValue];
      -[CNMutableContact setCropRect:](self->_contact, "setCropRect:");
    }
  }
  return 1;
}

- (id)validCountryCodes
{
  return 0;
}

- (int64_t)contactTypeFromPersonFlags:(int64_t)a3
{
  return (a3 & 7) == 1;
}

- (unint64_t)personFlagsByAddingContactType:(int64_t)a3 toFlags:(unint64_t)a4
{
  return a4 & 0xFFFFFFFFFFFFFFF8 | (a3 == 1);
}

- (int64_t)sharedPhotoDisplayPreferenceFromPersonFlags:(int64_t)a3
{
  if ((unint64_t)(a3 >> 6) - 1 >= 3) {
    return 0;
  }
  else {
    return a3 >> 6;
  }
}

- (unint64_t)personFlagsByAddingSharedPhotoDisplayPreference:(int64_t)a3 toFlags:(unint64_t)a4
{
  if ((unint64_t)(a3 - 1) >= 3) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = ((a3 - 1) << 6) + 64;
  }
  return v4 | a4 & 0xFFFFFFFFFFFFFF3FLL;
}

- (BOOL)setPersonFlags:(int64_t)a3
{
  return 1;
}

- (int64_t)personFlags
{
  unint64_t v3 = [(CNContactVCardParsedResultBuilder *)self personFlagsByAddingContactType:[(CNMutableContact *)self->_contact contactType] toFlags:0];
  int64_t v4 = [(CNMutableContact *)self->_contact sharedPhotoDisplayPreference];

  return [(CNContactVCardParsedResultBuilder *)self personFlagsByAddingSharedPhotoDisplayPreference:v4 toFlags:v3];
}

- (void).cxx_destruct
{
}

@end