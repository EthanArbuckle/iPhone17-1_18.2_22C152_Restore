@interface GEODrivingWalkingInstruction
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODrivingWalkingInstruction)init;
- (GEODrivingWalkingInstruction)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)continueCommands;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mergeCommands;
- (id)normalCommands;
- (id)title;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsContinueCommand:(uint64_t)a1;
- (void)_addNoFlagsMergeCommand:(uint64_t)a1;
- (void)_addNoFlagsNormalCommand:(uint64_t)a1;
- (void)_readContinueCommands;
- (void)_readMergeCommands;
- (void)_readNormalCommands;
- (void)_readTitle;
- (void)addContinueCommand:(uint64_t)a1;
- (void)addMergeCommand:(uint64_t)a1;
- (void)addNormalCommand:(uint64_t)a1;
- (void)mergeFrom:(void *)a1;
- (void)readAll:(uint64_t)a1;
- (void)setArtwork:(uint64_t)a1;
- (void)setTitle:(uint64_t)a1;
- (void)setWaypointInfo:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEODrivingWalkingInstruction

- (GEODrivingWalkingInstruction)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODrivingWalkingInstruction;
  v2 = [(GEODrivingWalkingInstruction *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODrivingWalkingInstruction)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODrivingWalkingInstruction;
  v3 = [(GEODrivingWalkingInstruction *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_1472);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEODrivingWalkingInstruction _readTitle]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTitle:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 84) |= 0x20u;
  *(unsigned char *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)_readNormalCommands
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readNormalCommands_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)normalCommands
{
  if (a1)
  {
    v2 = a1;
    -[GEODrivingWalkingInstruction _readNormalCommands]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addNormalCommand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEODrivingWalkingInstruction _readNormalCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsNormalCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsNormalCommand:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readContinueCommands
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContinueCommands_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)continueCommands
{
  if (a1)
  {
    v2 = a1;
    -[GEODrivingWalkingInstruction _readContinueCommands]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addContinueCommand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEODrivingWalkingInstruction _readContinueCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsContinueCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsContinueCommand:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readMergeCommands
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMergeCommands_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)mergeCommands
{
  if (a1)
  {
    v2 = a1;
    -[GEODrivingWalkingInstruction _readMergeCommands]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addMergeCommand:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEODrivingWalkingInstruction _readMergeCommands](a1);
    -[GEODrivingWalkingInstruction _addNoFlagsMergeCommand:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsMergeCommand:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)setArtwork:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 84) |= 2u;
  *(unsigned char *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setWaypointInfo:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 84) |= 0x40u;
  *(unsigned char *)(a1 + 84) |= 0x80u;
  objc_storeStrong((id *)(a1 + 64), a2);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODrivingWalkingInstruction;
  id v4 = [(GEODrivingWalkingInstruction *)&v8 description];
  id v5 = [(GEODrivingWalkingInstruction *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODrivingWalkingInstruction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEODrivingWalkingInstruction readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEODrivingWalkingInstruction title]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"title"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v9 = *(id *)(a1 + 48);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v61 != v11) {
              objc_enumerationMutation(v9);
            }
            v13 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v8 addObject:v14];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v10);
      }

      if (a2) {
        v15 = @"normalCommand";
      }
      else {
        v15 = @"normal_command";
      }
      [v4 setObject:v8 forKey:v15];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v17 = *(id *)(a1 + 32);
      uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v57 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            if (a2) {
              [v21 jsonRepresentation];
            }
            else {
            v22 = [v21 dictionaryRepresentation];
            }
            [v16 addObject:v22];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v18);
      }

      if (a2) {
        v23 = @"continueCommand";
      }
      else {
        v23 = @"continue_command";
      }
      [v4 setObject:v16 forKey:v23];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v25 = *(id *)(a1 + 40);
      uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v53;
        do
        {
          for (uint64_t k = 0; k != v26; ++k)
          {
            if (*(void *)v53 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v52 + 1) + 8 * k);
            if (a2) {
              [v29 jsonRepresentation];
            }
            else {
            v30 = [v29 dictionaryRepresentation];
            }
            [v24 addObject:v30];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v64 count:16];
        }
        while (v26);
      }

      if (a2) {
        v31 = @"mergeCommand";
      }
      else {
        v31 = @"merge_command";
      }
      [v4 setObject:v24 forKey:v31];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v32 = *(void **)(a1 + 8);
      if (v32)
      {
        id v33 = v32;
        objc_sync_enter(v33);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtwork_tags_1);
        objc_sync_exit(v33);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v34 = *(id *)(a1 + 24);
    v35 = v34;
    if (v34)
    {
      if (a2) {
        [v34 jsonRepresentation];
      }
      else {
      v36 = [v34 dictionaryRepresentation];
      }
      [v4 setObject:v36 forKey:@"artwork"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v37 = *(void **)(a1 + 8);
      if (v37)
      {
        id v38 = v37;
        objc_sync_enter(v38);
        GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWaypointInfo_tags);
        objc_sync_exit(v38);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v39 = *(id *)(a1 + 64);
    v40 = v39;
    if (v39)
    {
      if (a2)
      {
        v41 = [v39 jsonRepresentation];
        v42 = @"waypointInfo";
      }
      else
      {
        v41 = [v39 dictionaryRepresentation];
        v42 = @"waypoint_info";
      }
      [v4 setObject:v41 forKey:v42];
    }
    v43 = *(void **)(a1 + 16);
    if (v43)
    {
      v44 = [v43 dictionaryRepresentation];
      v45 = v44;
      if (a2)
      {
        v46 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v44, "count"));
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __58__GEODrivingWalkingInstruction__dictionaryRepresentation___block_invoke;
        v50[3] = &unk_1E53D8860;
        id v47 = v46;
        id v51 = v47;
        [v45 enumerateKeysAndObjectsUsingBlock:v50];
        id v48 = v47;
      }
      else
      {
        id v48 = v44;
      }
      [v4 setObject:v48 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODrivingWalkingInstruction _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1500;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1501;
      }
      GEODrivingWalkingInstructionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEODrivingWalkingInstructionCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __58__GEODrivingWalkingInstruction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v8 = [GEOFormattedString alloc];
      if (a3) {
        id v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
      }
      else {
        id v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
      }
      id v10 = v9;
      -[GEODrivingWalkingInstruction setTitle:](v6, v9);
    }
    if (a3) {
      uint64_t v11 = @"normalCommand";
    }
    else {
      uint64_t v11 = @"normal_command";
    }
    v12 = [v5 objectForKeyedSubscript:v11];
    objc_opt_class();
    id v54 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v64 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v63 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [GEOFormattedString alloc];
              if (a3) {
                v20 = [(GEOFormattedString *)v19 initWithJSON:v18];
              }
              else {
                v20 = [(GEOFormattedString *)v19 initWithDictionary:v18];
              }
              v21 = v20;
              -[GEODrivingWalkingInstruction addNormalCommand:](v6, v20);
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v63 objects:v69 count:16];
        }
        while (v15);
      }

      id v5 = v54;
    }

    if (a3) {
      v22 = @"continueCommand";
    }
    else {
      v22 = @"continue_command";
    }
    v23 = [v5 objectForKeyedSubscript:v22];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v60 != v27) {
              objc_enumerationMutation(v24);
            }
            uint64_t v29 = *(void *)(*((void *)&v59 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v30 = [GEOFormattedString alloc];
              if (a3) {
                v31 = [(GEOFormattedString *)v30 initWithJSON:v29];
              }
              else {
                v31 = [(GEOFormattedString *)v30 initWithDictionary:v29];
              }
              v32 = v31;
              -[GEODrivingWalkingInstruction addContinueCommand:](v6, v31);
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v59 objects:v68 count:16];
        }
        while (v26);
      }

      id v5 = v54;
    }

    if (a3) {
      id v33 = @"mergeCommand";
    }
    else {
      id v33 = @"merge_command";
    }
    id v34 = [v5 objectForKeyedSubscript:v33];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v35 = v34;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v37; ++k)
          {
            if (*(void *)v56 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v41 = [GEOFormattedString alloc];
              if (a3) {
                v42 = [(GEOFormattedString *)v41 initWithJSON:v40];
              }
              else {
                v42 = [(GEOFormattedString *)v41 initWithDictionary:v40];
              }
              v43 = v42;
              -[GEODrivingWalkingInstruction addMergeCommand:](v6, v42);
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v55 objects:v67 count:16];
        }
        while (v37);
      }

      id v5 = v54;
    }

    v44 = [v5 objectForKeyedSubscript:@"artwork"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v45 = [GEOPBTransitArtwork alloc];
      if (a3) {
        v46 = [(GEOPBTransitArtwork *)v45 initWithJSON:v44];
      }
      else {
        v46 = [(GEOPBTransitArtwork *)v45 initWithDictionary:v44];
      }
      id v47 = v46;
      -[GEODrivingWalkingInstruction setArtwork:](v6, v46);
    }
    if (a3) {
      id v48 = @"waypointInfo";
    }
    else {
      id v48 = @"waypoint_info";
    }
    v49 = [v5 objectForKeyedSubscript:v48];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v50 = [GEOFormattedString alloc];
      if (a3) {
        id v51 = [(GEOFormattedString *)v50 initWithJSON:v49];
      }
      else {
        id v51 = [(GEOFormattedString *)v50 initWithDictionary:v49];
      }
      long long v52 = v51;
      -[GEODrivingWalkingInstruction setWaypointInfo:](v6, v51);
    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEODrivingWalkingInstructionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODrivingWalkingInstructionIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v6 = self->_normalCommands;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_continueCommands;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_mergeCommands;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteSubmessage();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    if (self->_artwork) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_waypointInfo) {
      PBDataWriterWriteSubmessage();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEODrivingWalkingInstructionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 0);
  id v8 = [(GEOFormattedString *)self->_title copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = self->_normalCommands;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v39;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v39 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v13) copyWithZone:a3];
        -[GEODrivingWalkingInstruction addNormalCommand:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v11);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v15 = self->_continueCommands;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v35;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v18) copyWithZone:a3];
        -[GEODrivingWalkingInstruction addContinueCommand:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v16);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v20 = self->_mergeCommands;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v23), "copyWithZone:", a3, (void)v30);
        -[GEODrivingWalkingInstruction addMergeCommand:](v5, v24);

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v21);
  }

  id v25 = [(GEOPBTransitArtwork *)self->_artwork copyWithZone:a3];
  long long v26 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v25;

  id v27 = [(GEOFormattedString *)self->_waypointInfo copyWithZone:a3];
  long long v28 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v27;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 1),
         -[GEODrivingWalkingInstruction readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[7]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((normalCommands = self->_normalCommands, !((unint64_t)normalCommands | v4[6]))
     || -[NSMutableArray isEqual:](normalCommands, "isEqual:"))
    && ((continueCommands = self->_continueCommands, !((unint64_t)continueCommands | v4[4]))
     || -[NSMutableArray isEqual:](continueCommands, "isEqual:"))
    && ((mergeCommands = self->_mergeCommands, !((unint64_t)mergeCommands | v4[5]))
     || -[NSMutableArray isEqual:](mergeCommands, "isEqual:"))
    && ((artworuint64_t k = self->_artwork, !((unint64_t)artwork | v4[3]))
     || -[GEOPBTransitArtwork isEqual:](artwork, "isEqual:")))
  {
    waypointInfo = self->_waypointInfo;
    if ((unint64_t)waypointInfo | v4[8]) {
      char v11 = -[GEOFormattedString isEqual:](waypointInfo, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEODrivingWalkingInstruction readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOFormattedString *)self->_title hash];
  uint64_t v4 = [(NSMutableArray *)self->_normalCommands hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_continueCommands hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_mergeCommands hash];
  unint64_t v7 = [(GEOPBTransitArtwork *)self->_artwork hash];
  return v6 ^ v7 ^ [(GEOFormattedString *)self->_waypointInfo hash];
}

- (void)mergeFrom:(void *)a1
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  -[GEODrivingWalkingInstruction readAll:]((uint64_t)v3, 0);
  uint64_t v4 = (void *)a1[7];
  uint64_t v5 = v3[7];
  if (v4)
  {
    if (v5) {
      objc_msgSend(v4, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEODrivingWalkingInstruction setTitle:]((uint64_t)a1, v3[7]);
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v3[6];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEODrivingWalkingInstruction addNormalCommand:]((uint64_t)a1, *(void **)(*((void *)&v33 + 1) + 8 * i));
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v3[4];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        -[GEODrivingWalkingInstruction addContinueCommand:]((uint64_t)a1, *(void **)(*((void *)&v29 + 1) + 8 * j));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v13);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v3[5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        -[GEODrivingWalkingInstruction addMergeCommand:]((uint64_t)a1, *(void **)(*((void *)&v25 + 1) + 8 * k));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v18);
  }

  uint64_t v21 = (void *)a1[3];
  uint64_t v22 = v3[3];
  if (v21)
  {
    if (v22) {
      [v21 mergeFrom:(void)v25];
    }
  }
  else if (v22)
  {
    -[GEODrivingWalkingInstruction setArtwork:]((uint64_t)a1, v3[3]);
  }
  uint64_t v23 = (void *)a1[8];
  long long v24 = v3[8];
  if (v23)
  {
    if (v24) {
      objc_msgSend(v23, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[GEODrivingWalkingInstruction setWaypointInfo:]((uint64_t)a1, v3[8]);
  }
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(v1 + 84) |= 1u;
    *(unsigned char *)(v1 + 84) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEODrivingWalkingInstruction readAll:](v1, 0);
    [*(id *)(v1 + 56) clearUnknownFields:1];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v3 = *(id *)(v1 + 48);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v27;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v27 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v26 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v5);
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v8 = *(id *)(v1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v23;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * v12++) clearUnknownFields:1];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v31 count:16];
      }
      while (v10);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = *(id *)(v1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "clearUnknownFields:", 1, (void)v18);
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v30 count:16];
      }
      while (v15);
    }

    [*(id *)(v1 + 24) clearUnknownFields:1];
    return [*(id *)(v1 + 64) clearUnknownFields:1];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_normalCommands, 0);
  objc_storeStrong((id *)&self->_mergeCommands, 0);
  objc_storeStrong((id *)&self->_continueCommands, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end