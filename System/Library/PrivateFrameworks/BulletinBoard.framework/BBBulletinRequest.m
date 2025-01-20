@interface BBBulletinRequest
- (BOOL)hasAdditionalAttachmentsModificationsRelativeTo:(id)a3;
- (BOOL)hasContentModificationsRelativeTo:(id)a3;
- (BOOL)showsUnreadIndicator;
- (BOOL)tentative;
- (unint64_t)expirationEvents;
- (void)_updateSupplementaryAction:(id)a3;
- (void)addAlertSuppressionAppID:(id)a3;
- (void)addAttachmentOfType:(int64_t)a3;
- (void)addButton:(id)a3;
- (void)generateNewBulletinID;
- (void)publish;
- (void)publish:(BOOL)a3;
- (void)setContextValue:(id)a3 forKey:(id)a4;
- (void)setExpirationEvents:(unint64_t)a3;
- (void)setPrimaryAttachmentType:(int64_t)a3;
- (void)setSupplementaryActions:(id)a3;
- (void)setSupplementaryActions:(id)a3 forLayout:(int64_t)a4;
- (void)withdraw;
@end

@implementation BBBulletinRequest

- (void)setContextValue:(id)a3 forKey:(id)a4
{
  v24[2] = *MEMORY[0x263EF8340];
  id v20 = a3;
  id v6 = a4;
  if (v20 && v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v23[0] = @"value";
      v23[1] = @"key";
      v24[0] = v20;
      v24[1] = v6;
      v11 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
      id v12 = [v9 exceptionWithName:v10 reason:@"key must be of type NSString" userInfo:v11];

      objc_exception_throw(v12);
    }
    if ((BBIsValueAllowed(v20) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x263EFF940];
      uint64_t v14 = *MEMORY[0x263EFF4A0];
      v15 = NSString;
      v16 = BBAllowedClasses();
      v17 = [v15 stringWithFormat:@"value must be one of and contain only the following types: %@", v16];
      v21[0] = @"value";
      v21[1] = @"key";
      v22[0] = v20;
      v22[1] = v6;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      id v19 = [v13 exceptionWithName:v14 reason:v17 userInfo:v18];

      objc_exception_throw(v19);
    }
    v7 = [(BBBulletin *)self context];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v7, "count") + 1);
    [v8 addEntriesFromDictionary:v7];
    [v8 setValue:v20 forKey:v6];
    [(BBBulletin *)self setContext:v8];
  }
}

- (void)setPrimaryAttachmentType:(int64_t)a3
{
  v5 = [(BBBulletin *)self primaryAttachment];
  id v6 = (void *)[v5 mutableCopy];
  v7 = v6;
  if (v6) {
    v8 = v6;
  }
  else {
    v8 = objc_alloc_init(BBMutableAttachmentMetadata);
  }
  v9 = v8;

  [(BBMutableAttachmentMetadata *)v9 setType:a3];
  [(BBBulletin *)self setPrimaryAttachment:v9];
}

- (void)addAttachmentOfType:(int64_t)a3
{
  uint64_t v10 = objc_alloc_init(BBMutableAttachmentMetadata);
  [(BBMutableAttachmentMetadata *)v10 setType:a3];
  v5 = [(BBBulletin *)self additionalAttachments];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF8C0] array];
  }
  v8 = v7;

  v9 = [v8 arrayByAddingObject:v10];

  [(BBBulletin *)self setAdditionalAttachments:v9];
}

- (void)addButton:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"BBBulletinRequest.m", 153, @"%@-addButton -> cannot be nil", objc_opt_class() object file lineNumber description];
  }
  v5 = [(BBBulletin *)self buttons];
  id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  [v6 addObjectsFromArray:v5];
  [v6 addObject:v8];
  [(BBBulletin *)self setButtons:v6];
}

- (void)publish:(BOOL)a3
{
}

- (void)publish
{
}

- (void)withdraw
{
}

- (void)setSupplementaryActions:(id)a3
{
}

- (void)setSupplementaryActions:(id)a3 forLayout:(int64_t)a4
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__BBBulletinRequest_setSupplementaryActions_forLayout___block_invoke;
  v9[3] = &unk_264295DF0;
  v9[4] = self;
  id v6 = objc_msgSend(a3, "bs_mapNoNulls:", v9);
  id v7 = [(BBBulletin *)self supplementaryActionsByLayout];
  id v8 = [NSNumber numberWithInteger:a4];
  if (v6) {
    [v7 setObject:v6 forKey:v8];
  }
  else {
    [v7 removeObjectForKey:v8];
  }
}

id __55__BBBulletinRequest_setSupplementaryActions_forLayout___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 identifier];

  if (v4)
  {
    v4 = (void *)[v3 copy];
    [*(id *)(a1 + 32) _updateSupplementaryAction:v4];
  }

  return v4;
}

- (void)_updateSupplementaryAction:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 setActionType:7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = objc_msgSend(v4, "actions", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [(BBBulletinRequest *)self _updateSupplementaryAction:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)addAlertSuppressionAppID:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"BBBulletinRequest.m", 218, @"%@-addAlertSuppressionAppID must be passed a string -> %@", objc_opt_class(), v10 object file lineNumber description];
    }
    id v5 = objc_alloc(MEMORY[0x263EFF9C0]);
    uint64_t v6 = [(BBBulletin *)self alertSuppressionAppIDs_deprecated];
    uint64_t v7 = (void *)[v5 initWithSet:v6];

    uint64_t v8 = (void *)[v10 copy];
    [v7 addObject:v8];
    [(BBBulletin *)self setAlertSuppressionAppIDs_deprecated:v7];
  }
}

- (BOOL)showsUnreadIndicator
{
  return 0;
}

- (BOOL)tentative
{
  return 0;
}

- (unint64_t)expirationEvents
{
  return self->_expirationEvents;
}

- (void)setExpirationEvents:(unint64_t)a3
{
  self->_expirationEvents = a3;
}

- (BOOL)hasContentModificationsRelativeTo:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self content];
  if (v5 || ([v4 content], (v163 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = [(BBBulletin *)self content];
    [v4 content];
    v167 = v168 = v6;
    int v7 = 1;
    if (!objc_msgSend(v6, "isEqualToContent:"))
    {
      int v194 = 1;
      int v195 = 0;
      memset(v193, 0, sizeof(v193));
      memset(v178, 0, sizeof(v178));
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      goto LABEL_92;
    }
  }
  else
  {
    v163 = 0;
    int v7 = 0;
  }
  uint64_t v14 = [(BBBulletin *)self modalAlertContent];
  *(_DWORD *)&v193[40] = v14 == 0;
  int v194 = v7;
  v166 = (void *)v14;
  if (v14 || ([v4 modalAlertContent], (v161 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v15 = [(BBBulletin *)self modalAlertContent];
    [v4 modalAlertContent];
    v164 = v165 = v15;
    if (!objc_msgSend(v15, "isEqualToContent:"))
    {
      int v195 = 1;
      *(void *)&v193[32] = 0;
      memset(v193, 0, 28);
      memset(v178, 0, sizeof(v178));
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      *(_DWORD *)&v193[28] = 1;
      goto LABEL_92;
    }
    int v16 = 1;
  }
  else
  {
    v161 = 0;
    int v16 = 0;
  }
  v162 = [(BBBulletin *)self starkBannerContent];
  *(_DWORD *)&v193[36] = v162 == 0;
  *(_DWORD *)&v193[28] = v16;
  if (v162 || ([v4 starkBannerContent], (v157 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = [(BBBulletin *)self starkBannerContent];
    [v4 starkBannerContent];
    v159 = v160 = v17;
    if (!objc_msgSend(v17, "isEqualToContent:"))
    {
      int v195 = 1;
      v178[1] = 0;
      *(_DWORD *)&v193[32] = 0;
      v178[0] = 0;
      memset(v193, 0, 24);
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      v178[2] = 1;
      *(_DWORD *)&v193[24] = 1;
      goto LABEL_92;
    }
    *(_DWORD *)&v193[24] = 1;
  }
  else
  {
    v157 = 0;
    *(_DWORD *)&v193[24] = 0;
  }
  v158 = [(BBBulletin *)self icon];
  *(_DWORD *)&v193[32] = v158 == 0;
  if (v158 || ([v4 icon], (v154 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = v5;
    id v19 = [(BBBulletin *)self icon];
    [v4 icon];
    v155 = v156 = v19;
    if (!objc_msgSend(v19, "isEqual:"))
    {
      int v195 = 1;
      *(void *)((char *)v178 + 4) = 0;
      *(void *)&v193[8] = 0;
      *(void *)v193 = 0;
      LODWORD(v178[0]) = 0;
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      *(void *)&v193[16] = 1;
      id v5 = v18;
      BOOL v8 = 0;
      goto LABEL_92;
    }
    *(_DWORD *)&v193[16] = 1;
    id v5 = v18;
  }
  else
  {
    v154 = 0;
    *(_DWORD *)&v193[16] = 0;
  }
  int v20 = [(BBBulletin *)self hasEventDate];
  if (v20 != [v4 hasEventDate])
  {
    *(void *)((char *)v178 + 4) = 0;
    *(_DWORD *)&v193[20] = 0;
    *(void *)&v193[8] = 0;
    *(void *)v193 = 0;
    LODWORD(v178[0]) = 0;
    int v191 = 0;
    int v176 = 0;
    BOOL v192 = 0;
    int v189 = 0;
    int v175 = 0;
    BOOL v190 = 0;
    int v187 = 0;
    int v173 = 0;
    BOOL v188 = 0;
    int v185 = 0;
    int v172 = 0;
    BOOL v186 = 0;
    int v183 = 0;
    int v171 = 0;
    BOOL v184 = 0;
    int v182 = 0;
    int v170 = 0;
    BOOL v8 = 0;
    int v180 = 0;
    int v169 = 0;
    BOOL v181 = 0;
    int v179 = 0;
    int v174 = 0;
    memset(v177, 0, sizeof(v177));
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    HIDWORD(v178[2]) = 0;
    *(void *)((char *)&v178[1] + 4) = 0x100000001;
    goto LABEL_92;
  }
  uint64_t v21 = [(BBBulletin *)self date];
  *(_DWORD *)&v193[20] = v21 == 0;
  v153 = (void *)v21;
  if (v21 || ([v4 date], (v149 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v22 = [(BBBulletin *)self date];
    [v4 date];
    v151 = v152 = v22;
    if (!objc_msgSend(v22, "isEqualToDate:"))
    {
      int v195 = 1;
      v178[0] = 0;
      *(void *)v193 = 0;
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      *(void *)&v193[8] = 1;
      goto LABEL_92;
    }
    *(_DWORD *)&v193[8] = 1;
  }
  else
  {
    v149 = 0;
    *(_DWORD *)&v193[8] = 0;
  }
  uint64_t v23 = [(BBBulletin *)self endDate];
  *(_DWORD *)&v193[12] = v23 == 0;
  v150 = (void *)v23;
  if (v23 || ([v4 endDate], (v145 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v24 = [(BBBulletin *)self endDate];
    v147 = [v4 endDate];
    v148 = v24;
    if (!objc_msgSend(v24, "isEqualToDate:"))
    {
      int v195 = 1;
      v178[0] = 0x100000000;
      int v191 = 0;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      *(void *)v193 = 1;
      goto LABEL_92;
    }
    *(_DWORD *)v193 = 1;
  }
  else
  {
    v145 = 0;
    *(_DWORD *)v193 = 0;
  }
  uint64_t v25 = [(BBBulletin *)self recencyDate];
  *(_DWORD *)&v193[4] = v25 == 0;
  v146 = (void *)v25;
  if (v25 || ([v4 recencyDate], (v141 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v26 = [(BBBulletin *)self recencyDate];
    v143 = [v4 recencyDate];
    v144 = v26;
    if (!objc_msgSend(v26, "isEqualToDate:"))
    {
      int v195 = 1;
      int v176 = 0;
      BOOL v192 = 0;
      int v189 = 0;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v191 = 1;
      goto LABEL_92;
    }
    int v191 = 1;
  }
  else
  {
    v141 = 0;
    int v191 = 0;
  }
  uint64_t v27 = [(BBBulletin *)self timeZone];
  BOOL v192 = v27 == 0;
  v142 = (void *)v27;
  if (v27 || ([v4 timeZone], (v137 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = [(BBBulletin *)self timeZone];
    v139 = [v4 timeZone];
    v140 = v28;
    if (!objc_msgSend(v28, "isEqualToTimeZone:"))
    {
      int v195 = 1;
      int v175 = 0;
      BOOL v190 = 0;
      int v187 = 0;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v189 = 1;
      goto LABEL_92;
    }
    int v189 = 1;
  }
  else
  {
    v137 = 0;
    int v189 = 0;
  }
  uint64_t v29 = [(BBBulletin *)self context];
  BOOL v190 = v29 == 0;
  v138 = (void *)v29;
  if (v29 || ([v4 context], (v133 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v30 = [(BBBulletin *)self context];
    v135 = [v4 context];
    v136 = v30;
    if (!objc_msgSend(v30, "isEqualToDictionary:"))
    {
      int v195 = 1;
      int v173 = 0;
      BOOL v188 = 0;
      int v185 = 0;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v187 = 1;
      goto LABEL_92;
    }
    int v187 = 1;
  }
  else
  {
    v133 = 0;
    int v187 = 0;
  }
  uint64_t v31 = [(BBBulletin *)self primaryAttachment];
  BOOL v188 = v31 == 0;
  v134 = (void *)v31;
  if (v31 || ([v4 primaryAttachment], (v130 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v32 = [(BBBulletin *)self primaryAttachment];
    v131 = [v4 primaryAttachment];
    v132 = v32;
    if (objc_msgSend(v32, "hasContentModificationsRelativeTo:"))
    {
      int v195 = 1;
      int v172 = 0;
      BOOL v186 = 0;
      int v183 = 0;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v173 = 1;
      int v185 = 1;
      goto LABEL_92;
    }
    int v185 = 1;
  }
  else
  {
    v130 = 0;
    int v185 = 0;
  }
  if ([(BBBulletinRequest *)self hasAdditionalAttachmentsModificationsRelativeTo:v4])
  {
    int v172 = 0;
    BOOL v186 = 0;
    int v183 = 0;
    int v171 = 0;
    BOOL v184 = 0;
    int v182 = 0;
    int v170 = 0;
    BOOL v8 = 0;
    int v180 = 0;
    int v169 = 0;
    BOOL v181 = 0;
    int v179 = 0;
    int v174 = 0;
    memset(v177, 0, sizeof(v177));
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    HIDWORD(v178[2]) = 0;
    LODWORD(v178[1]) = 1;
    *(void *)((char *)&v178[1] + 4) = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    goto LABEL_92;
  }
  uint64_t v33 = [(BBBulletin *)self alertSuppressionContexts];
  BOOL v186 = v33 == 0;
  v129 = (void *)v33;
  if (v33
    || ([v4 alertSuppressionContexts], (v125 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v34 = [(BBBulletin *)self alertSuppressionContexts];
    v127 = [v4 alertSuppressionContexts];
    v128 = v34;
    if (!objc_msgSend(v34, "isEqualToSet:"))
    {
      int v195 = 1;
      int v171 = 0;
      BOOL v184 = 0;
      int v182 = 0;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v173 = 1;
      int v172 = 1;
      int v183 = 1;
      goto LABEL_92;
    }
    int v183 = 1;
  }
  else
  {
    v125 = 0;
    int v183 = 0;
  }
  uint64_t v35 = [(BBBulletin *)self accessoryIconMask];
  BOOL v184 = v35 == 0;
  v126 = (void *)v35;
  if (v35 || ([v4 accessoryIconMask], (v121 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v36 = [(BBBulletin *)self accessoryIconMask];
    v123 = [v4 accessoryIconMask];
    v124 = v36;
    if (!objc_msgSend(v36, "isEqual:"))
    {
      int v195 = 1;
      int v170 = 0;
      BOOL v8 = 0;
      int v180 = 0;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v173 = 1;
      int v172 = 1;
      int v171 = 1;
      int v182 = 1;
      goto LABEL_92;
    }
    int v182 = 1;
  }
  else
  {
    v121 = 0;
    int v182 = 0;
  }
  uint64_t v37 = [(BBBulletin *)self accessoryImage];
  BOOL v90 = v37 == 0;
  v122 = (void *)v37;
  if (v37 || ([v4 accessoryImage], (v117 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v38 = [(BBBulletin *)self accessoryImage];
    v119 = [v4 accessoryImage];
    v120 = (void *)v38;
    if (!objc_msgSend((id)v38, "isEqual:"))
    {
      int v195 = 1;
      int v169 = 0;
      BOOL v181 = 0;
      int v179 = 0;
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v39 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v173 = 1;
      int v172 = 1;
      int v171 = 1;
      int v170 = 1;
      int v180 = 1;
      goto LABEL_90;
    }
    int v180 = 1;
  }
  else
  {
    v117 = 0;
    int v180 = 0;
  }
  uint64_t v40 = [(BBBulletin *)self supplementaryActionsByLayout];
  BOOL v181 = v40 == 0;
  v118 = (void *)v40;
  if (v40
    || ([v4 supplementaryActionsByLayout], (v114 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v38 = [(BBBulletin *)self supplementaryActionsByLayout];
    v115 = [v4 supplementaryActionsByLayout];
    v116 = (void *)v38;
    int v195 = 1;
    if (!objc_msgSend((id)v38, "isEqualToDictionary:"))
    {
      int v174 = 0;
      memset(v177, 0, sizeof(v177));
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v39 = 0;
      HIDWORD(v178[2]) = 0;
      LODWORD(v178[1]) = 1;
      *(void *)((char *)&v178[1] + 4) = 0x100000001;
      v178[0] = 0x100000001;
      int v176 = 1;
      int v175 = 1;
      int v173 = 1;
      int v172 = 1;
      int v171 = 1;
      int v170 = 1;
      int v169 = 1;
      int v179 = 1;
      goto LABEL_90;
    }
    int v179 = 1;
  }
  else
  {
    v114 = 0;
    int v179 = 0;
  }
  uint64_t v38 = [(BBBulletin *)self wantsFullscreenPresentation];
  if (v38 != [v4 wantsFullscreenPresentation])
  {
    int v174 = 0;
    memset(v177, 0, sizeof(v177));
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v39 = 0;
    int v195 = 1;
    HIDWORD(v178[2]) = 0;
    LODWORD(v178[1]) = 1;
    *(void *)((char *)&v178[1] + 4) = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    goto LABEL_90;
  }
  int v52 = [(BBBulletin *)self ignoresQuietMode];
  v89 = v4;
  if (v52 != [v4 ignoresQuietMode]) {
    goto LABEL_234;
  }
  int v53 = [(BBBulletin *)self ignoresDowntime];
  if (v53 != [v4 ignoresDowntime]) {
    goto LABEL_234;
  }
  int v54 = [(BBBulletin *)self preemptsPresentedAlert];
  if (v54 != [v4 preemptsPresentedAlert]) {
    goto LABEL_234;
  }
  int v55 = [(BBBulletin *)self displaysActionsInline];
  if (v55 != [v4 displaysActionsInline]) {
    goto LABEL_234;
  }
  int v56 = [(BBBulletin *)self dateIsAllDay];
  if (v56 != [v4 dateIsAllDay]
    || (int64_t v57 = -[BBBulletin dateFormatStyle](self, "dateFormatStyle"), v57 != [v4 dateFormatStyle])
    || (int v58 = -[BBBulletin clearable](self, "clearable"), v58 != [v4 clearable])
    || (int v59 = [(BBBulletin *)self turnsOnDisplay],
        v59 != [v4 turnsOnDisplay])
    || (int64_t v60 = -[BBBulletin sectionSubtype](self, "sectionSubtype"), v60 != [v4 sectionSubtype])
    || (int64_t v61 = [(BBBulletin *)self contentPreviewSetting],
        v61 != [v4 contentPreviewSetting])
    || (int v62 = [(BBBulletin *)self preventAutomaticRemovalFromLockScreen],
        v62 != [v4 preventAutomaticRemovalFromLockScreen])
    || (int64_t v63 = -[BBBulletin lockScreenPriority](self, "lockScreenPriority"), v63 != [v4 lockScreenPriority]))
  {
LABEL_234:
    int v174 = 0;
    memset(v177, 0, sizeof(v177));
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    HIDWORD(v178[2]) = 0;
    LODWORD(v178[1]) = 1;
    *(void *)((char *)&v178[1] + 4) = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    goto LABEL_235;
  }
  uint64_t v64 = [(BBBulletin *)self summaryArgument];
  v112 = [v89 summaryArgument];
  v113 = (void *)v64;
  if (!BSEqualStrings()
    || (int v65 = [(BBBulletin *)self hasCriticalIcon],
        v65 != [v89 hasCriticalIcon])
    || (int v66 = [(BBBulletin *)self hasSubordinateIcon],
        v66 != [v89 hasSubordinateIcon])
    || (unint64_t v67 = [(BBBulletin *)self summaryArgumentCount],
        v67 != [v89 summaryArgumentCount])
    || (int64_t v68 = -[BBBulletin backgroundStyle](self, "backgroundStyle"), v68 != [v89 backgroundStyle]))
  {
    memset(v177, 0, sizeof(v177));
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    HIDWORD(v178[2]) = 0;
    LODWORD(v178[1]) = 1;
    *(void *)((char *)&v178[1] + 4) = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    goto LABEL_235;
  }
  uint64_t v69 = [(BBBulletin *)self header];
  v110 = [v89 header];
  v111 = (void *)v69;
  if (!BSEqualStrings())
  {
    *(_OWORD *)&v177[4] = 0uLL;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(_DWORD *)v177 = 1;
    goto LABEL_235;
  }
  uint64_t v70 = [(BBBulletin *)self footer];
  v108 = [v89 footer];
  v109 = (void *)v70;
  if (!BSEqualStrings())
  {
    *(void *)&v177[8] = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    *(_DWORD *)&v177[16] = 0;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    goto LABEL_235;
  }
  uint64_t v71 = [(BBBulletin *)self threadSummary];
  v106 = [v89 threadSummary];
  v107 = (void *)v71;
  if (!BSEqualObjects())
  {
    *(void *)&v177[12] = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(_DWORD *)&v177[8] = 1;
    goto LABEL_235;
  }
  uint64_t v72 = [(BBBulletin *)self summary];
  v104 = [v89 summary];
  v105 = (void *)v72;
  if (!BSEqualObjects())
  {
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    *(_DWORD *)&v177[16] = 0;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    goto LABEL_235;
  }
  uint64_t v73 = [(BBBulletin *)self attributedMessage];
  v102 = [v89 attributedMessage];
  v103 = (void *)v73;
  if (!BSEqualObjects())
  {
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    goto LABEL_235;
  }
  uint64_t v74 = [(BBBulletin *)self eventBehavior];
  v100 = [v89 eventBehavior];
  v101 = (void *)v74;
  if (!BSEqualObjects()
    || (int v75 = -[BBBulletin isHighlight](self, "isHighlight"), v75 != [v89 isHighlight])
    || (unint64_t v76 = [(BBBulletin *)self priorityNotificationStatus],
        v76 != [v89 priorityNotificationStatus])
    || (unint64_t v77 = [(BBBulletin *)self notificationSummaryStatus],
        v77 != [v89 notificationSummaryStatus]))
  {
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    int v9 = 1;
    goto LABEL_235;
  }
  uint64_t v78 = [(BBBulletin *)self spotlightIdentifier];
  v98 = [v89 spotlightIdentifier];
  v99 = (void *)v78;
  if (!BSEqualObjects())
  {
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    int v9 = 1;
    int v10 = 1;
    goto LABEL_235;
  }
  uint64_t v79 = [(BBBulletin *)self categoryID];
  v96 = [v89 categoryID];
  v97 = (void *)v79;
  if (!BSEqualStrings())
  {
    int v12 = 0;
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    int v9 = 1;
    int v10 = 1;
    int v11 = 1;
    goto LABEL_235;
  }
  uint64_t v80 = [(BBBulletin *)self contentType];
  v94 = [v89 contentType];
  v95 = (void *)v80;
  if (!BSEqualStrings()
    || (int v81 = [(BBBulletin *)self screenCaptureProhibited],
        v81 != [v89 screenCaptureProhibited]))
  {
    int v13 = 0;
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    int v9 = 1;
    int v10 = 1;
    int v11 = 1;
    int v12 = 1;
LABEL_235:
    BOOL v8 = v90;
    id v4 = v89;
    goto LABEL_92;
  }
  uint64_t v82 = [(BBBulletin *)self communicationContext];
  v92 = [v89 communicationContext];
  v93 = (void *)v82;
  if (!BSEqualObjects()
    || (unint64_t v83 = -[BBBulletin interruptionLevel](self, "interruptionLevel"), v83 != [v89 interruptionLevel])
    || (-[BBBulletin relevanceScore](self, "relevanceScore"), float v85 = v84, [v89 relevanceScore], v85 != v86))
  {
    int v195 = 1;
    v178[2] = 1;
    v178[1] = 0x100000001;
    v178[0] = 0x100000001;
    int v176 = 1;
    int v175 = 1;
    int v173 = 1;
    int v172 = 1;
    int v171 = 1;
    int v170 = 1;
    int v169 = 1;
    int v174 = 1;
    *(void *)v177 = 0x100000001;
    *(void *)&v177[8] = 0x100000001;
    *(_DWORD *)&v177[16] = 1;
    int v9 = 1;
    int v10 = 1;
    int v11 = 1;
    int v12 = 1;
    int v13 = 1;
    goto LABEL_235;
  }
  uint64_t v87 = [(BBBulletin *)self filterCriteria];
  id v4 = v89;
  uint64_t v38 = [v89 filterCriteria];
  v91 = (void *)v87;
  int v88 = BSEqualStrings();
  int v39 = 1;
  int v195 = 1;
  LODWORD(v178[2]) = 1;
  HIDWORD(v178[2]) = v88;
  v178[1] = 0x100000001;
  v178[0] = 0x100000001;
  int v176 = 1;
  int v175 = 1;
  int v173 = 1;
  int v172 = 1;
  int v171 = 1;
  int v170 = 1;
  int v169 = 1;
  int v174 = 1;
  *(void *)v177 = 0x100000001;
  *(void *)&v177[8] = 0x100000001;
  *(_DWORD *)&v177[16] = 1;
  int v9 = 1;
  int v10 = 1;
  int v11 = 1;
  int v12 = 1;
  int v13 = 1;
LABEL_90:
  BOOL v8 = v90;
  if (v39)
  {
    v41 = self;
    int v42 = v9;
    id v43 = v4;
    int v44 = v10;
    int v45 = v11;
    int v46 = v12;
    int v47 = v13;

    int v13 = v47;
    int v12 = v46;
    int v11 = v45;
    int v10 = v44;
    id v4 = v43;
    int v9 = v42;
    self = v41;
  }
LABEL_92:
  if (v13)
  {
  }
  if (v12)
  {
  }
  if (v11)
  {

    if (!v10)
    {
LABEL_98:
      if (!v9) {
        goto LABEL_100;
      }
      goto LABEL_99;
    }
  }
  else if (!v10)
  {
    goto LABEL_98;
  }

  if (v9)
  {
LABEL_99:
  }
LABEL_100:
  if (*(_DWORD *)&v177[16])
  {
  }
  if (*(_DWORD *)&v177[12])
  {
  }
  if (*(_DWORD *)&v177[8])
  {
  }
  if (*(_DWORD *)&v177[4])
  {
  }
  if (*(_DWORD *)v177)
  {
  }
  if (v174)
  {
  }
  if (v179)
  {
  }
  if (v181) {

  }
  if (v169) {
  if (v180)
  }
  {
  }
  if (v8) {

  }
  if (v170) {
  if (v182)
  }
  {
  }
  if (v184) {

  }
  if (v171) {
  if (v183)
  }
  {
  }
  if (v186) {

  }
  if (v172) {
  if (v185)
  }
  {
  }
  if (v188) {

  }
  if (v173) {
  if (v187)
  }
  {
  }
  if (v190) {

  }
  if (v175) {
  if (v189)
  }
  {
  }
  if (v192) {

  }
  if (v176) {
  if (v191)
  }
  {
  }
  if (*(_DWORD *)&v193[4]) {

  }
  if (LODWORD(v178[0])) {
  if (*(_DWORD *)v193)
  }
  {
  }
  if (*(_DWORD *)&v193[12]) {

  }
  if (HIDWORD(v178[0])) {
  if (*(_DWORD *)&v193[8])
  }
  {
  }
  if (*(_DWORD *)&v193[20]) {

  }
  if (LODWORD(v178[1])) {
  if (*(_DWORD *)&v193[16])
  }
  {
  }
  if (*(_DWORD *)&v193[32]) {

  }
  if (HIDWORD(v178[1]))
  {

    if (!*(_DWORD *)&v193[24])
    {
LABEL_178:
      if (!*(_DWORD *)&v193[36]) {
        goto LABEL_180;
      }
      goto LABEL_179;
    }
  }
  else if (!*(_DWORD *)&v193[24])
  {
    goto LABEL_178;
  }

  if (*(_DWORD *)&v193[36]) {
LABEL_179:
  }

LABEL_180:
  if (LODWORD(v178[2]))
  {

    if (!*(_DWORD *)&v193[28])
    {
LABEL_182:
      if (!*(_DWORD *)&v193[40]) {
        goto LABEL_184;
      }
      goto LABEL_183;
    }
  }
  else if (!*(_DWORD *)&v193[28])
  {
    goto LABEL_182;
  }

  if (*(_DWORD *)&v193[40]) {
LABEL_183:
  }

LABEL_184:
  if (!v195)
  {
    if (!v194) {
      goto LABEL_186;
    }
LABEL_199:

    if (v5) {
      goto LABEL_187;
    }
    goto LABEL_200;
  }

  if (v194) {
    goto LABEL_199;
  }
LABEL_186:
  if (v5) {
    goto LABEL_187;
  }
LABEL_200:

LABEL_187:
  if (HIDWORD(v178[2]))
  {
    v48 = [(BBBulletin *)self speechLanguage];
    v49 = [v4 speechLanguage];
    int v50 = BSEqualStrings() ^ 1;
  }
  else
  {
    LOBYTE(v50) = 1;
  }

  return v50;
}

- (BOOL)hasAdditionalAttachmentsModificationsRelativeTo:(id)a3
{
  id v4 = a3;
  id v5 = [(BBBulletin *)self additionalAttachments];
  uint64_t v6 = [v4 additionalAttachments];
  uint64_t v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        int v9 = [v5 objectAtIndexedSubscript:v8];
        int v10 = [v6 objectAtIndexedSubscript:v8];
        int v11 = [v9 hasContentModificationsRelativeTo:v10];

        if (v11) {
          break;
        }
        ++v8;
      }
      while (v8 < [v5 count]);
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)generateNewBulletinID
{
  id v4 = [MEMORY[0x263F08C38] UUID];
  id v3 = [v4 UUIDString];
  [(BBBulletin *)self setBulletinID:v3];
}

@end