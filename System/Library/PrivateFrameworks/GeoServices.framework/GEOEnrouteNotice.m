@interface GEOEnrouteNotice
+ (BOOL)isValid:(id)a3;
+ (Class)guidanceType;
- (BOOL)hasGroupItemHorizontalDisplayOrder;
- (BOOL)hasGroupItemVerticalDisplayOrder;
- (BOOL)hasHighlightDistance;
- (BOOL)hasObjectGroupId;
- (BOOL)hasObjectIdentifier;
- (BOOL)hasPriority;
- (BOOL)hasRouteAnnotation;
- (BOOL)hasType;
- (BOOL)hasZilchPathIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOEnrouteNotice)init;
- (GEOEnrouteNotice)initWithData:(id)a3;
- (GEOEnrouteNotice)initWithDictionary:(id)a3;
- (GEOEnrouteNotice)initWithJSON:(id)a3;
- (GEORouteAnnotation)routeAnnotation;
- (NSMutableArray)guidances;
- (NSString)objectIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)guidanceAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)guidancesCount;
- (unint64_t)hash;
- (unsigned)groupItemHorizontalDisplayOrder;
- (unsigned)groupItemVerticalDisplayOrder;
- (unsigned)highlightDistance;
- (unsigned)objectGroupId;
- (unsigned)priority;
- (unsigned)zilchPathIndex;
- (void)_addNoFlagsGuidance:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readGuidances;
- (void)_readObjectIdentifier;
- (void)_readRouteAnnotation;
- (void)addGuidance:(id)a3;
- (void)clearGuidances;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setGroupItemHorizontalDisplayOrder:(unsigned int)a3;
- (void)setGroupItemVerticalDisplayOrder:(unsigned int)a3;
- (void)setGuidances:(id)a3;
- (void)setHasGroupItemHorizontalDisplayOrder:(BOOL)a3;
- (void)setHasGroupItemVerticalDisplayOrder:(BOOL)a3;
- (void)setHasHighlightDistance:(BOOL)a3;
- (void)setHasObjectGroupId:(BOOL)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasZilchPathIndex:(BOOL)a3;
- (void)setHighlightDistance:(unsigned int)a3;
- (void)setObjectGroupId:(unsigned int)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setRouteAnnotation:(id)a3;
- (void)setType:(int)a3;
- (void)setZilchPathIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOEnrouteNotice

- (GEOEnrouteNotice)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOEnrouteNotice;
  v2 = [(GEOEnrouteNotice *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOEnrouteNotice)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOEnrouteNotice;
  v3 = [(GEOEnrouteNotice *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  __int16 flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2080;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E53E00D0[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CAMERA"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SIGNAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ANNOTATION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readObjectIdentifier
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readObjectIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasObjectIdentifier
{
  return self->_objectIdentifier != 0;
}

- (NSString)objectIdentifier
{
  -[GEOEnrouteNotice _readObjectIdentifier]((uint64_t)self);
  objectIdentifier = self->_objectIdentifier;

  return objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (void)_readGuidances
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGuidances_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)guidances
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  guidances = self->_guidances;

  return guidances;
}

- (void)setGuidances:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  guidances = self->_guidances;
  self->_guidances = v4;
}

- (void)clearGuidances
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  guidances = self->_guidances;

  [(NSMutableArray *)guidances removeAllObjects];
}

- (void)addGuidance:(id)a3
{
  id v4 = a3;
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  -[GEOEnrouteNotice _addNoFlagsGuidance:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsGuidance:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)guidancesCount
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  guidances = self->_guidances;

  return [(NSMutableArray *)guidances count];
}

- (id)guidanceAtIndex:(unint64_t)a3
{
  -[GEOEnrouteNotice _readGuidances]((uint64_t)self);
  guidances = self->_guidances;

  return (id)[(NSMutableArray *)guidances objectAtIndex:a3];
}

+ (Class)guidanceType
{
  return (Class)objc_opt_class();
}

- (unsigned)highlightDistance
{
  return self->_highlightDistance;
}

- (void)setHighlightDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_highlightDistance = a3;
}

- (void)setHasHighlightDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2052;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHighlightDistance
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)objectGroupId
{
  return self->_objectGroupId;
}

- (void)setObjectGroupId:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_objectGroupId = a3;
}

- (void)setHasObjectGroupId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2056;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasObjectGroupId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2064;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readRouteAnnotation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 88) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOEnrouteNoticeReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRouteAnnotation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasRouteAnnotation
{
  return self->_routeAnnotation != 0;
}

- (GEORouteAnnotation)routeAnnotation
{
  -[GEOEnrouteNotice _readRouteAnnotation]((uint64_t)self);
  routeAnnotation = self->_routeAnnotation;

  return routeAnnotation;
}

- (void)setRouteAnnotation:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_routeAnnotation, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2112;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return self->_groupItemHorizontalDisplayOrder;
}

- (void)setGroupItemHorizontalDisplayOrder:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_groupItemHorizontalDisplayOrder = a3;
}

- (void)setHasGroupItemHorizontalDisplayOrder:(BOOL)a3
{
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasGroupItemHorizontalDisplayOrder
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return self->_groupItemVerticalDisplayOrder;
}

- (void)setGroupItemVerticalDisplayOrder:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_groupItemVerticalDisplayOrder = a3;
}

- (void)setHasGroupItemVerticalDisplayOrder:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2050;
  }
  else {
    __int16 v3 = 2048;
  }
  *(_WORD *)&self->___int16 flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasGroupItemVerticalDisplayOrder
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOEnrouteNotice;
  id v4 = [(GEOEnrouteNotice *)&v8 description];
  id v5 = [(GEOEnrouteNotice *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOEnrouteNotice _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_53;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(_WORD *)(a1 + 88) & 0x20) != 0)
  {
    uint64_t v5 = *(int *)(a1 + 80);
    if (v5 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 80));
      objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v6 = off_1E53E00D0[v5];
    }
    [v4 setObject:v6 forKey:@"type"];
  }
  id v7 = [(id)a1 objectIdentifier];
  if (v7)
  {
    if (a2) {
      objc_super v8 = @"objectIdentifier";
    }
    else {
      objc_super v8 = @"object_identifier";
    }
    [v4 setObject:v7 forKey:v8];
  }

  if ([*(id *)(a1 + 24) count])
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v10 = *(id *)(a1 + 24);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v44 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if (a2) {
            [v15 jsonRepresentation];
          }
          else {
          v16 = [v15 dictionaryRepresentation];
          }
          [v9 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"guidance"];
  }
  __int16 v17 = *(_WORD *)(a1 + 88);
  if ((v17 & 4) != 0)
  {
    v23 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    if (a2) {
      v24 = @"highlightDistance";
    }
    else {
      v24 = @"highlight_distance";
    }
    [v4 setObject:v23 forKey:v24];

    __int16 v17 = *(_WORD *)(a1 + 88);
    if ((v17 & 8) == 0)
    {
LABEL_26:
      if ((v17 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_27;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_26;
  }
  v25 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  if (a2) {
    v26 = @"objectGroupId";
  }
  else {
    v26 = @"object_group_id";
  }
  [v4 setObject:v25 forKey:v26];

  if ((*(_WORD *)(a1 + 88) & 0x10) != 0)
  {
LABEL_27:
    v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
    [v4 setObject:v18 forKey:@"priority"];
  }
LABEL_28:
  v19 = [(id)a1 routeAnnotation];
  v20 = v19;
  if (v19)
  {
    if (a2)
    {
      v21 = [v19 jsonRepresentation];
      v22 = @"routeAnnotation";
    }
    else
    {
      v21 = [v19 dictionaryRepresentation];
      v22 = @"route_annotation";
    }
    [v4 setObject:v21 forKey:v22];
  }
  __int16 v27 = *(_WORD *)(a1 + 88);
  if ((v27 & 0x40) != 0)
  {
    v37 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    if (a2) {
      v38 = @"zilchPathIndex";
    }
    else {
      v38 = @"zilch_path_index";
    }
    [v4 setObject:v37 forKey:v38];

    __int16 v27 = *(_WORD *)(a1 + 88);
    if ((v27 & 1) == 0)
    {
LABEL_44:
      if ((v27 & 2) == 0) {
        goto LABEL_49;
      }
      goto LABEL_45;
    }
  }
  else if ((v27 & 1) == 0)
  {
    goto LABEL_44;
  }
  v39 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
  if (a2) {
    v40 = @"groupItemHorizontalDisplayOrder";
  }
  else {
    v40 = @"group_item_horizontal_display_order";
  }
  [v4 setObject:v39 forKey:v40];

  if ((*(_WORD *)(a1 + 88) & 2) != 0)
  {
LABEL_45:
    v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    if (a2) {
      v29 = @"groupItemVerticalDisplayOrder";
    }
    else {
      v29 = @"group_item_vertical_display_order";
    }
    [v4 setObject:v28 forKey:v29];
  }
LABEL_49:
  v30 = *(void **)(a1 + 16);
  if (v30)
  {
    v31 = [v30 dictionaryRepresentation];
    v32 = v31;
    if (a2)
    {
      v33 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v31, "count"));
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __46__GEOEnrouteNotice__dictionaryRepresentation___block_invoke;
      v41[3] = &unk_1E53D8860;
      id v34 = v33;
      id v42 = v34;
      [v32 enumerateKeysAndObjectsUsingBlock:v41];
      id v35 = v34;

      v32 = v35;
    }
    [v4 setObject:v32 forKey:@"Unknown Fields"];
  }
LABEL_53:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOEnrouteNotice _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOEnrouteNotice__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOEnrouteNotice)initWithDictionary:(id)a3
{
  return (GEOEnrouteNotice *)-[GEOEnrouteNotice _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_72;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_72;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"CAMERA"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"SIGNAL"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"ANNOTATION"])
    {
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_16:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"objectIdentifier";
  }
  else {
    v9 = @"object_identifier";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = (void *)[v10 copy];
    [a1 setObjectIdentifier:v11];
  }
  uint64_t v12 = [v5 objectForKeyedSubscript:@"guidance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = v5;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v41 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [GEOGuidanceEvent alloc];
            if (a3) {
              uint64_t v20 = [(GEOGuidanceEvent *)v19 initWithJSON:v18];
            }
            else {
              uint64_t v20 = [(GEOGuidanceEvent *)v19 initWithDictionary:v18];
            }
            v21 = (void *)v20;
            [a1 addGuidance:v20];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      }
      while (v15);
    }

    id v5 = v39;
  }

  if (a3) {
    v22 = @"highlightDistance";
  }
  else {
    v22 = @"highlight_distance";
  }
  v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHighlightDistance:", objc_msgSend(v23, "unsignedIntValue"));
  }

  if (a3) {
    v24 = @"objectGroupId";
  }
  else {
    v24 = @"object_group_id";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setObjectGroupId:", objc_msgSend(v25, "unsignedIntValue"));
  }

  v26 = [v5 objectForKeyedSubscript:@"priority"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPriority:", objc_msgSend(v26, "unsignedIntValue"));
  }

  if (a3) {
    __int16 v27 = @"routeAnnotation";
  }
  else {
    __int16 v27 = @"route_annotation";
  }
  v28 = [v5 objectForKeyedSubscript:v27];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v29 = [GEORouteAnnotation alloc];
    if (a3) {
      uint64_t v30 = [(GEORouteAnnotation *)v29 initWithJSON:v28];
    }
    else {
      uint64_t v30 = [(GEORouteAnnotation *)v29 initWithDictionary:v28];
    }
    v31 = (void *)v30;
    [a1 setRouteAnnotation:v30];
  }
  if (a3) {
    v32 = @"zilchPathIndex";
  }
  else {
    v32 = @"zilch_path_index";
  }
  v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v33, "unsignedIntValue"));
  }

  if (a3) {
    id v34 = @"groupItemHorizontalDisplayOrder";
  }
  else {
    id v34 = @"group_item_horizontal_display_order";
  }
  id v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setGroupItemHorizontalDisplayOrder:", objc_msgSend(v35, "unsignedIntValue"));
  }

  if (a3) {
    v36 = @"groupItemVerticalDisplayOrder";
  }
  else {
    v36 = @"group_item_vertical_display_order";
  }
  v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setGroupItemVerticalDisplayOrder:", objc_msgSend(v37, "unsignedIntValue"));
  }

LABEL_72:
  return a1;
}

- (GEOEnrouteNotice)initWithJSON:(id)a3
{
  return (GEOEnrouteNotice *)-[GEOEnrouteNotice _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_2208;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_2209;
    }
    GEOEnrouteNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOEnrouteNoticeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOEnrouteNoticeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOEnrouteNoticeReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOEnrouteNoticeIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOEnrouteNotice *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 0x20) != 0) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_objectIdentifier) {
      PBDataWriterWriteStringField();
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    objc_super v6 = self->_guidances;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_routeAnnotation) {
      PBDataWriterWriteSubmessage();
    }
    __int16 v11 = (__int16)self->_flags;
    if ((v11 & 0x40) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if (v11)
    {
      PBDataWriterWriteUint32Field();
      __int16 v11 = (__int16)self->_flags;
    }
    if ((v11 & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  __int16 v11 = (id *)a3;
  [(GEOEnrouteNotice *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v11 + 1, self->_reader);
  *((_DWORD *)v11 + 12) = self->_readerMarkPos;
  *((_DWORD *)v11 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v11 + 20) = self->_type;
    *((_WORD *)v11 + 44) |= 0x20u;
  }
  if (self->_objectIdentifier) {
    objc_msgSend(v11, "setObjectIdentifier:");
  }
  if ([(GEOEnrouteNotice *)self guidancesCount])
  {
    [v11 clearGuidances];
    unint64_t v4 = [(GEOEnrouteNotice *)self guidancesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOEnrouteNotice *)self guidanceAtIndex:i];
        [v11 addGuidance:v7];
      }
    }
  }
  __int16 flags = (__int16)self->_flags;
  uint64_t v9 = v11;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v11 + 17) = self->_highlightDistance;
    *((_WORD *)v11 + 44) |= 4u;
    __int16 flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_11:
      if ((flags & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((flags & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_DWORD *)v11 + 18) = self->_objectGroupId;
  *((_WORD *)v11 + 44) |= 8u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_12:
    *((_DWORD *)v11 + 19) = self->_priority;
    *((_WORD *)v11 + 44) |= 0x10u;
  }
LABEL_13:
  if (self->_routeAnnotation)
  {
    objc_msgSend(v11, "setRouteAnnotation:");
    uint64_t v9 = v11;
  }
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 0x40) != 0)
  {
    *((_DWORD *)v9 + 21) = self->_zilchPathIndex;
    *((_WORD *)v9 + 44) |= 0x40u;
    __int16 v10 = (__int16)self->_flags;
    if ((v10 & 1) == 0)
    {
LABEL_17:
      if ((v10 & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v9 + 15) = self->_groupItemHorizontalDisplayOrder;
  *((_WORD *)v9 + 44) |= 1u;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
LABEL_18:
    *((_DWORD *)v9 + 16) = self->_groupItemVerticalDisplayOrder;
    *((_WORD *)v9 + 44) |= 2u;
  }
LABEL_19:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOEnrouteNotice *)self readAll:0];
    if ((*(_WORD *)&self->_flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 80) = self->_type;
      *(_WORD *)(v5 + 88) |= 0x20u;
    }
    uint64_t v9 = [(NSString *)self->_objectIdentifier copyWithZone:a3];
    __int16 v10 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v9;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    __int16 v11 = self->_guidances;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          long long v15 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
          [(id)v5 addGuidance:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 68) = self->_highlightDistance;
      *(_WORD *)(v5 + 88) |= 4u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_16:
        if ((flags & 0x10) == 0) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(v5 + 72) = self->_objectGroupId;
    *(_WORD *)(v5 + 88) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
    {
LABEL_18:
      id v17 = -[GEORouteAnnotation copyWithZone:](self->_routeAnnotation, "copyWithZone:", a3, (void)v22);
      uint64_t v18 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v17;

      __int16 v19 = (__int16)self->_flags;
      if ((v19 & 0x40) != 0)
      {
        *(_DWORD *)(v5 + 84) = self->_zilchPathIndex;
        *(_WORD *)(v5 + 88) |= 0x40u;
        __int16 v19 = (__int16)self->_flags;
        if ((v19 & 1) == 0)
        {
LABEL_20:
          if ((v19 & 2) == 0)
          {
LABEL_22:
            uint64_t v20 = self->_unknownFields;
            id v8 = *(id *)(v5 + 16);
            *(void *)(v5 + 16) = v20;
            goto LABEL_23;
          }
LABEL_21:
          *(_DWORD *)(v5 + 64) = self->_groupItemVerticalDisplayOrder;
          *(_WORD *)(v5 + 88) |= 2u;
          goto LABEL_22;
        }
      }
      else if ((v19 & 1) == 0)
      {
        goto LABEL_20;
      }
      *(_DWORD *)(v5 + 60) = self->_groupItemHorizontalDisplayOrder;
      *(_WORD *)(v5 + 88) |= 1u;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
LABEL_17:
    *(_DWORD *)(v5 + 76) = self->_priority;
    *(_WORD *)(v5 + 88) |= 0x10u;
    goto LABEL_18;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOEnrouteNoticeReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_23:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  [(GEOEnrouteNotice *)self readAll:1];
  [v4 readAll:1];
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 0x20) != 0)
  {
    if ((v5 & 0x20) == 0 || self->_type != *((_DWORD *)v4 + 20)) {
      goto LABEL_43;
    }
  }
  else if ((v5 & 0x20) != 0)
  {
    goto LABEL_43;
  }
  objectIdentifier = self->_objectIdentifier;
  if ((unint64_t)objectIdentifier | *((void *)v4 + 4)
    && !-[NSString isEqual:](objectIdentifier, "isEqual:"))
  {
    goto LABEL_43;
  }
  guidances = self->_guidances;
  if ((unint64_t)guidances | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](guidances, "isEqual:")) {
      goto LABEL_43;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v9 = *((_WORD *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_highlightDistance != *((_DWORD *)v4 + 17)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((flags & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_objectGroupId != *((_DWORD *)v4 + 18)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_43;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_priority != *((_DWORD *)v4 + 19)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_43;
  }
  routeAnnotation = self->_routeAnnotation;
  if ((unint64_t)routeAnnotation | *((void *)v4 + 5))
  {
    if (!-[GEORouteAnnotation isEqual:](routeAnnotation, "isEqual:"))
    {
LABEL_43:
      BOOL v11 = 0;
      goto LABEL_44;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v9 = *((_WORD *)v4 + 44);
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 21)) {
      goto LABEL_43;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_43;
  }
  if (flags)
  {
    if ((v9 & 1) == 0 || self->_groupItemHorizontalDisplayOrder != *((_DWORD *)v4 + 15)) {
      goto LABEL_43;
    }
  }
  else if (v9)
  {
    goto LABEL_43;
  }
  BOOL v11 = (v9 & 2) == 0;
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_groupItemVerticalDisplayOrder != *((_DWORD *)v4 + 16)) {
      goto LABEL_43;
    }
    BOOL v11 = 1;
  }
LABEL_44:

  return v11;
}

- (unint64_t)hash
{
  [(GEOEnrouteNotice *)self readAll:1];
  if ((*(_WORD *)&self->_flags & 0x20) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_objectIdentifier hash];
  uint64_t v5 = [(NSMutableArray *)self->_guidances hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    uint64_t v7 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = 0;
    if ((flags & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v7 = 2654435761 * self->_highlightDistance;
  if ((flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_objectGroupId;
  if ((flags & 0x10) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_priority;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v9 = 0;
LABEL_11:
  unint64_t v10 = [(GEORouteAnnotation *)self->_routeAnnotation hash];
  __int16 v11 = (__int16)self->_flags;
  if ((v11 & 0x40) == 0)
  {
    uint64_t v12 = 0;
    if (v11) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v13 = 0;
    if ((v11 & 2) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
  }
  uint64_t v12 = 2654435761 * self->_zilchPathIndex;
  if ((v11 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v13 = 2654435761 * self->_groupItemHorizontalDisplayOrder;
  if ((v11 & 2) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v14 = 2654435761 * self->_groupItemVerticalDisplayOrder;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if ((*((_WORD *)v4 + 44) & 0x20) != 0)
  {
    self->_type = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x20u;
  }
  if (*((void *)v4 + 4)) {
    -[GEOEnrouteNotice setObjectIdentifier:](self, "setObjectIdentifier:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOEnrouteNotice addGuidance:](self, "addGuidance:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 44);
  if ((v10 & 4) != 0)
  {
    self->_highlightDistance = *((_DWORD *)v4 + 17);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v10 = *((_WORD *)v4 + 44);
    if ((v10 & 8) == 0)
    {
LABEL_14:
      if ((v10 & 0x10) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v10 & 8) == 0)
  {
    goto LABEL_14;
  }
  self->_objectGroupId = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 8u;
  if ((*((_WORD *)v4 + 44) & 0x10) != 0)
  {
LABEL_15:
    self->_priority = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_16:
  routeAnnotation = self->_routeAnnotation;
  uint64_t v12 = *((void *)v4 + 5);
  if (routeAnnotation)
  {
    if (v12) {
      -[GEORouteAnnotation mergeFrom:](routeAnnotation, "mergeFrom:");
    }
  }
  else if (v12)
  {
    [(GEOEnrouteNotice *)self setRouteAnnotation:"setRouteAnnotation:"];
  }
  __int16 v13 = *((_WORD *)v4 + 44);
  if ((v13 & 0x40) == 0)
  {
    if ((v13 & 1) == 0) {
      goto LABEL_26;
    }
LABEL_30:
    self->_groupItemHorizontalDisplayOrder = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_flags |= 1u;
    if ((*((_WORD *)v4 + 44) & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  self->_zilchPathIndex = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 0x40u;
  __int16 v13 = *((_WORD *)v4 + 44);
  if (v13) {
    goto LABEL_30;
  }
LABEL_26:
  if ((v13 & 2) != 0)
  {
LABEL_27:
    self->_groupItemVerticalDisplayOrder = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_28:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x80) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      id v5 = reader;
      objc_sync_enter(v5);
      GEOEnrouteNoticeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2213);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x880u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOEnrouteNotice *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_guidances;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }

    [(GEORouteAnnotation *)self->_routeAnnotation clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeAnnotation, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
  objc_storeStrong((id *)&self->_guidances, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end