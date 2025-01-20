@interface CSLHexAppGraph
+ (BOOL)supportsSecureCoding;
+ (id)unarchiveFromDictionaryRepresentation:(id)a3;
+ (id)unarchiveFromPropertyList:(id)a3;
- (BOOL)addNode:(id)a3;
- (BOOL)checkHexes:()unordered_set<CSL:()std:()std:(std:(id)a4 :(id)a5 allocator<CSL::Hex>> *)a3 :equal_to<CSL::Hex> :hash<CSL::Hex> :Hex connectedNodes:disconnectedNodes:;
- (BOOL)checkNode:(id)a3 connectedNodes:(id)a4 disconnectedNodes:(id)a5;
- (BOOL)containsNodeAtHex:(Hex)a3;
- (BOOL)hasDictionaryRepresentation;
- (BOOL)hex:(Hex)a3 hasAtLeastNNearbyNodes:(int64_t)a4 withinRange:(unint64_t)a5;
- (BOOL)integrityCheck;
- (BOOL)integrityCheckIgnoringNode:(id)a3 shouldCheckNeighbors:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLonelyHex:(Hex)a3;
- (BOOL)isVerticalOnly;
- (CSLHexAppGraph)init;
- (CSLHexAppGraph)initWithCoder:(id)a3;
- (CSLHexAppGraph)initWithNodes:(id)a3;
- (CSLHexAppGraph)initWithNodes:(id)a3 verticalOnly:(BOOL)a4;
- (CSLHexAppGraphDelegate)delegate;
- (Hex)firstGoodEmptyHex;
- (NSMutableDictionary)nodesByBundle;
- (NSMutableSet)changedNodes;
- (NSString)abbreviatedDescription;
- (float)normalizedHorizontalRadius;
- (float)normalizedVerticalBottom;
- (float)normalizedVerticalRadius;
- (float)normalizedVerticalTop;
- (id).cxx_construct;
- (id)_emplaceNodeAtHex:(Hex)a3 withBundleIdentifier:(id)a4;
- (id)addNodeWithBundleIdentifier:(id)a3;
- (id)allNodes;
- (id)archiveToPropertyList;
- (id)changeToMatch:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)disconnectedNodesCheckingHexes:()unordered_set<CSL:()std:()std:(std::allocator<CSL::Hex>> *)a3 :equal_to<CSL::Hex> :hash<CSL::Hex> :Hex;
- (id)initFromPropertyList:(id)a3;
- (id)initVerticalOnly:(BOOL)a3;
- (id)migrateToVerticalOnly;
- (id)nodeAtHex:(Hex)a3;
- (id)nodeWithBundleIdentifier:(id)a3;
- (id)removeNodeAtHex:(Hex)a3;
- (int)rowCount;
- (int64_t)directNeighborCountOfHex:(Hex)a3;
- (int64_t)neighborCountOfHex:(Hex)a3 upToMinimumNeighbors:(int64_t)a4 withinRange:(unint64_t)a5;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)lastReorderReason;
- (void)calculateNeighborCounts;
- (void)collapseAll343Holes;
- (void)collapseLonelyNodes:(id)a3;
- (void)collapseLonelyNodes:(id)a3 connectedNodes:(id)a4 disconnectedNodes:(id)a5;
- (void)collapseToHex:(Hex)a3 ignoringNode:(id)a4;
- (void)commitMovedNode:(id)a3 withReason:(unint64_t)a4;
- (void)decrementNeighborCountsForHex:(Hex)a3;
- (void)encodeWithCoder:(id)a3;
- (void)incrementNeighborCountsForHex:(Hex)a3;
- (void)move343Node:(id)a3 toHex:(Hex)a4 final:(BOOL)a5;
- (void)moveNode:(id)a3 toHex:(Hex)a4;
- (void)moveNode:(id)a3 toHex:(Hex)a4 final:(BOOL)a5;
- (void)moveNodesToTopWithBundleIdentifiers:(id)a3 forReason:(unint64_t)a4;
- (void)moveNodesWithBundleIdentifiers:(id)a3 toStartingHex:(Hex)a4 forReason:(unint64_t)a5;
- (void)removeNode:(id)a3;
- (void)removeNodeObjectForKey:(Hex)a3;
- (void)removeNodeUsingIterator:()__hash_map_const_iterator<std:(CSLHexAppNode *)__unsafe_unretained> :(void *> *>>)a3 __hash_const_iterator<std::__hash_node<std::__hash_value_type<CSL::Hex;
- (void)removeNodeWithoutReflow:(id)a3;
- (void)removeNodeWithoutReflowUsingIterator:()__hash_map_const_iterator<std:(CSLHexAppNode *)__unsafe_unretained> :(void *> *>>)a3 __hash_const_iterator<std::__hash_node<std::__hash_value_type<CSL::Hex;
- (void)resetToDefaults:(id)a3;
- (void)revertMove;
- (void)setChangedNodes:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastReorderReason:(unint64_t)a3;
- (void)setNode:(id)a3 toHex:(Hex)a4;
- (void)setNodeObject:(id)a3 forKey:(Hex)a4;
- (void)setNodesByBundle:(id)a3;
- (void)updateNormalizedRadius;
@end

@implementation CSLHexAppGraph

- (id)initVerticalOnly:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSLHexAppGraph;
  v4 = [(CSLHexAppGraph *)&v10 init];
  if (v4)
  {
    uint64_t v5 = +[NSMutableSet set];
    changedNodes = v4->_changedNodes;
    v4->_changedNodes = (NSMutableSet *)v5;

    uint64_t v7 = +[NSMutableDictionary dictionary];
    nodesByBundle = v4->_nodesByBundle;
    v4->_nodesByBundle = (NSMutableDictionary *)v7;

    *(_WORD *)&v4->_neighborCountValid = 257;
    v4->_isVerticalOnly = a3;
  }
  return v4;
}

- (CSLHexAppGraph)init
{
  v4 = +[NSString stringWithFormat:@"bridge usage should be calling initVerticalOnly: not init"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v9 = 138544642;
    id v10 = v5;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2048;
    v14 = self;
    __int16 v15 = 2114;
    CFStringRef v16 = @"CSLHexAppGraph.mm";
    __int16 v17 = 1024;
    int v18 = 107;
    __int16 v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&def_1A578, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
  }
  [v4 UTF8String];
  result = (CSLHexAppGraph *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (CSLHexAppGraph)initWithNodes:(id)a3
{
  return [(CSLHexAppGraph *)self initWithNodes:a3 verticalOnly:0];
}

- (CSLHexAppGraph)initWithNodes:(id)a3 verticalOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CSLHexAppGraph *)self initVerticalOnly:v4];
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          -[CSLHexAppGraph setNodeObject:forKey:](v7, "setNodeObject:forKey:", v12, objc_msgSend(v12, "hex", (void)v17));
          __int16 v13 = [(CSLHexAppGraph *)v7 nodesByBundle];
          v14 = [v12 bundleIdentifier];
          [v13 setObject:v12 forKey:v14];
        }
        id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v9);
    }

    [(CSLHexAppGraph *)v7 calculateNeighborCounts];
    if (![(CSLHexAppGraph *)v7 integrityCheck])
    {
      __int16 v15 = cslprf_icon_field_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        CSLHexNodesAbbreviatedDescription(v8);
        objc_claimAutoreleasedReturnValue();
        sub_27690();
      }

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  sub_19160((uint64_t)v27, (uint64_t)v4 + 32);
  if (self->_nodes.__table_.__p2_.__value_ == v29)
  {
    id v5 = +[BSEqualsBuilder builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    BOOL isVerticalOnly = self->_isVerticalOnly;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10564;
    v25[3] = &unk_3CC48;
    id v7 = v4;
    id v26 = v7;
    id v8 = [v5 appendBool:isVerticalOnly counterpart:v25];
    unint64_t lastReorderReason = self->_lastReorderReason;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1056C;
    v23[3] = &unk_3CB10;
    id v24 = v7;
    id v10 = [v5 appendUnsignedInteger:lastReorderReason counterpart:v23];
    next = (id *)self->_nodes.__table_.__p1_.__value_.__next_;
    if (next)
    {
      for (i = v28; i; i = (void *)*i)
      {
        id v13 = next[3];
        id v14 = next[3];
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10574;
        v20[3] = &unk_3CAE8;
        id v15 = v13;
        id v21 = v15;
        id v16 = v14;
        id v22 = v16;
        id v17 = objc_msgSend(v5, "appendEqualsBlocks:", v20, 0);

        next = (id *)*next;
        if (!next) {
          break;
        }
      }
    }
    unsigned __int8 v18 = [v5 isEqual];
  }
  else
  {
    unsigned __int8 v18 = 0;
  }
  sub_18C64((uint64_t)v27);

  return v18;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init((Class)BSHashBuilder);
  id v4 = [v3 appendBool:self->_isVerticalOnly];
  id v5 = [v3 appendUnsignedInteger:self->_lastReorderReason];
  for (i = (id *)self->_nodes.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v7 = i[3];
    id v8 = objc_msgSend(v3, "appendUnsignedInteger:", objc_msgSend(v7, "allPropertiesHash"));
  }
  id v9 = [v3 hash];

  return (unint64_t)v9;
}

- (BOOL)hasDictionaryRepresentation
{
  return self->_isVerticalOnly;
}

- (id)addNodeWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[CSLHexAppNode alloc] initWithBundleIdentifier:v4 hex:[(CSLHexAppGraph *)self firstGoodEmptyHex]];
  [(CSLHexAppNode *)v5 setDirectPlacementReason:7];
  [(CSLHexAppGraph *)self addNode:v5];

  return v5;
}

- (BOOL)addNode:(id)a3
{
  id v4 = a3;
  id v20 = [v4 hex];
  if (sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v20))
  {
    id v5 = cslprf_icon_field_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_27748();
    }
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [v4 bundleIdentifier];
    id v5 = [(CSLHexAppGraph *)self nodeWithBundleIdentifier:v7];

    BOOL v6 = v5 == 0;
    if (v5)
    {
      id v8 = cslprf_icon_field_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_276D8();
      }
    }
    else
    {
      if (![v4 placementReason]) {
        [v4 setDirectPlacementReason:7];
      }
      BOOL neighborCountValid = self->_neighborCountValid;
      [(CSLHexAppGraph *)self setNodeObject:v4 forKey:v20];
      id v10 = [(CSLHexAppGraph *)self nodesByBundle];
      __int16 v11 = [v4 bundleIdentifier];
      [v10 setObject:v4 forKey:v11];

      if (neighborCountValid)
      {
        [(CSLHexAppGraph *)self incrementNeighborCountsForHex:v20];
        self->_BOOL neighborCountValid = 1;
      }
      if ([(CSLHexAppGraph *)self isLonelyHex:v20])
      {
        v12 = +[NSMutableSet setWithObject:v4];
        [(CSLHexAppGraph *)self collapseLonelyNodes:v12];

        id v13 = [v4 savedHex];
        if (v20 != v13)
        {
          id v14 = cslprf_icon_field_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            id v18 = [v4 savedHex];
            sub_A010((int *)&v18, &__p);
            id v17 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &__p
                : (std::string *)__p.__r_.__value_.__r.__words[0];
            *(_DWORD *)buf = 138412546;
            id v23 = v4;
            __int16 v24 = 2080;
            v25 = v17;
            _os_log_error_impl(&def_1A578, v14, OS_LOG_TYPE_ERROR, "%@ is dirty, saved hex: %s", buf, 0x16u);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
        }
        objc_msgSend(v4, "commitHexForReason:isDirect:", objc_msgSend(v4, "placementReason"), 1);
      }
      [(CSLHexAppGraph *)self integrityCheckIgnoringNode:0 shouldCheckNeighbors:1];
      id v8 = [(CSLHexAppGraph *)self delegate];
      id v21 = v4;
      id v15 = +[NSArray arrayWithObjects:&v21 count:1];
      [v8 hexAppGraph:self addedNodes:v15 removedNodes:0 movedNodes:0];
    }
  }

  return v6;
}

- (Hex)firstGoodEmptyHex
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0x7FFFFFFFLL;
  *(_DWORD *)v12 = 1;
  *(void *)&v12[12] = 0;
  *(void *)&v12[4] = 0;
  *(void *)&v12[20] = 0x7FFFFFFF00000024;
  *(_DWORD *)&v12[28] = 0;
  unint64_t v8 = 0xFFFFFFFE00000000;
  do
  {
    if (self->_isVerticalOnly)
    {
      unint64_t v3 = sub_10B68((unsigned int *)&v8);
    }
    else
    {
      unint64_t value = self->_nodes.__table_.__p2_.__value_;
      if (!value)
      {
        uint64_t v4 = 0;
        goto LABEL_7;
      }
      unint64_t v3 = sub_10BCC((uint64_t)&v9);
    }
    unint64_t value = HIDWORD(v3);
LABEL_7:
    Hex v6 = (Hex)(value | (v4 << 32));
  }
  while (-[CSLHexAppGraph containsNodeAtHex:](self, "containsNodeAtHex:", v6, v8, v9, v10, v11, *(_OWORD *)v12, *(_OWORD *)&v12[16])|| !self->_isVerticalOnly && [(CSLHexAppGraph *)self isLonelyHex:v6]);
  return v6;
}

- (void)removeNode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 hex];
  [(CSLHexAppGraph *)self removeNodeUsingIterator:sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v5)];
}

- (id)removeNodeAtHex:(Hex)a3
{
  Hex v6 = a3;
  id v4 = sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v6);
  if (v4) {
    [(CSLHexAppGraph *)self removeNodeUsingIterator:v4];
  }
  return 0;
}

- (void)removeNodeUsingIterator:()__hash_map_const_iterator<std:(CSLHexAppNode *)__unsafe_unretained> :(void *> *>>)a3 __hash_const_iterator<std::__hash_node<std::__hash_value_type<CSL::Hex
{
  if (a3.var0.var0)
  {
    id v5 = *((id *)a3.var0.var0 + 3);
    Hex v6 = v5;
    if (self->_isVerticalOnly || [v5 hex])
    {
      [(NSMutableSet *)self->_changedNodes removeAllObjects];
      id v7 = [(CSLHexAppGraph *)self nodesByBundle];
      unint64_t v8 = [v6 bundleIdentifier];
      [v7 removeObjectForKey:v8];

      id v9 = [v6 hex];
      [(CSLHexAppGraph *)self removeNodeWithoutReflowUsingIterator:a3.var0.var0];
      [(CSLHexAppGraph *)self collapseToHex:v9 ignoringNode:0];
      uint64_t v10 = [(CSLHexAppGraph *)self delegate];
      id v13 = v6;
      uint64_t v11 = +[NSArray arrayWithObjects:&v13 count:1];
      v12 = [(NSMutableSet *)self->_changedNodes allObjects];
      [v10 hexAppGraph:self addedNodes:0 removedNodes:v11 movedNodes:v12];
    }
    else
    {
      uint64_t v10 = cslprf_icon_field_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_2780C();
      }
    }
  }
  else
  {
    Hex v6 = cslprf_icon_field_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_277C8(v6);
    }
  }
}

- (void)removeNodeWithoutReflow:(id)a3
{
  id v4 = a3;
  id v6 = [v4 hex];
  id v5 = sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v6);
  if (v5) {
    [(CSLHexAppGraph *)self removeNodeWithoutReflowUsingIterator:v5];
  }
}

- (void)removeNodeWithoutReflowUsingIterator:()__hash_map_const_iterator<std:(CSLHexAppNode *)__unsafe_unretained> :(void *> *>>)a3 __hash_const_iterator<std::__hash_node<std::__hash_value_type<CSL::Hex
{
  id v5 = cslprf_icon_field_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_27874((uint64_t)a3.var0.var0, v5, v6);
  }

  sub_194BC(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)a3.var0.var0);
  *(_WORD *)&self->_BOOL neighborCountValid = 256;
}

- (void)collapseToHex:(Hex)a3 ignoringNode:(id)a4
{
  Hex v30 = a3;
  id v6 = a4;
  if (self->_isVerticalOnly)
  {
    [(CSLHexAppGraph *)self collapse343ToHex:a3 ignoringNode:v6];
  }
  else
  {
    id v7 = cslprf_icon_field_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      sub_A010((int *)&v30, &v29);
      sub_27944();
    }

    uint64_t v8 = (uint64_t)v30;
    uint64_t v28 = (uint64_t)v30;
LABEL_6:
    uint64_t v24 = v8;
    int v25 = 0;
    int v26 = sub_18710(v8, -(int)v8 - HIDWORD(v8), SHIDWORD(v8));
    while (1)
    {
      *(void *)v27 = sub_1177C(&v24);
      *(_DWORD *)&v27[8] = v9;
      if (!v27[0]) {
        break;
      }
      uint64_t v10 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v27[4]];
      if (v10)
      {
        uint64_t v11 = cslprf_icon_field_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          sub_A010((int *)&v28, (std::string *)__p);
          if ((SBYTE7(v22) & 0x80u) == 0) {
            v12 = __p;
          }
          else {
            v12 = (void **)__p[0];
          }
          LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v10;
          WORD2(buf.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v12;
          _os_log_debug_impl(&def_1A578, v11, OS_LOG_TYPE_DEBUG, "[collapse] move %@ -> %s", (uint8_t *)&buf, 0x16u);
          if (SBYTE7(v22) < 0) {
            operator delete(__p[0]);
          }
        }

        [(CSLHexAppGraph *)self moveNode:v10 toHex:v28];
        uint64_t v28 = *(void *)&v27[4];

        uint64_t v8 = v28;
        goto LABEL_6;
      }
    }
    id v13 = cslprf_icon_field_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      sub_A010((int *)&v28, &buf);
      sub_278E8();
    }

    *(_OWORD *)std::string __p = 0u;
    long long v22 = 0u;
    int v23 = 1065353216;
    id v14 = +[NSMutableSet set];
    uint64_t v24 = v28;
    int v25 = 0;
    while (1)
    {
      *(void *)v27 = sub_1198C(&v24);
      *(_DWORD *)&v27[8] = v15;
      if (!v27[0]) {
        break;
      }
      id v16 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v27[4]];
      if (v16)
      {
        sub_187F0((uint64_t)__p, (int *)&v27[4], &v27[4]);
        if ([(CSLHexAppGraph *)self isLonelyHex:*(void *)&v27[4]])
        {
          id v17 = cslprf_icon_field_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v31 = 138412290;
            v32 = v16;
            _os_log_debug_impl(&def_1A578, v17, OS_LOG_TYPE_DEBUG, "[lonely] add %@", v31, 0xCu);
          }

          [v14 addObject:v16];
        }
      }
    }
    id v18 = +[NSMutableSet set];
    long long v19 = +[NSMutableSet set];
    sub_19634((uint64_t)v20, (uint64_t)__p);
    [(CSLHexAppGraph *)self checkHexes:v20 connectedNodes:v18 disconnectedNodes:v19];
    sub_18C64((uint64_t)v20);
    [v14 unionSet:v19];
    [(CSLHexAppGraph *)self integrityCheckIgnoringNode:v6 shouldCheckNeighbors:0];
    [(CSLHexAppGraph *)self collapseLonelyNodes:v14 connectedNodes:v18 disconnectedNodes:v19];
    [(CSLHexAppGraph *)self integrityCheckIgnoringNode:v6 shouldCheckNeighbors:1];

    sub_18C64((uint64_t)__p);
  }
}

- (id)disconnectedNodesCheckingHexes:()unordered_set<CSL:()std:()std:(std::allocator<CSL::Hex>> *)a3 :equal_to<CSL::Hex> :hash<CSL::Hex> :Hex
{
  id v5 = +[NSMutableSet set];
  id v6 = +[NSMutableSet set];
  for (i = a3->var0.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    uint64_t v8 = [(CSLHexAppGraph *)self nodeAtHex:i[2]];
    if (v8) {
      [(CSLHexAppGraph *)self checkNode:v8 connectedNodes:v6 disconnectedNodes:v5];
    }
  }

  return v5;
}

- (BOOL)checkHexes:()unordered_set<CSL:()std:()std:(std:(id)a4 :(id)a5 allocator<CSL::Hex>> *)a3 :equal_to<CSL::Hex> :hash<CSL::Hex> :Hex connectedNodes:disconnectedNodes:
{
  id v8 = a4;
  id v9 = a5;
  next = a3->var0.__p1_.__value_.__next_;
  if (next)
  {
    int v11 = 0;
    do
    {
      v12 = [(CSLHexAppGraph *)self nodeAtHex:next[2]];
      if (v12) {
        v11 |= [(CSLHexAppGraph *)self checkNode:v12 connectedNodes:v8 disconnectedNodes:v9];
      }

      next = (void *)*next;
    }
    while (next);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

- (BOOL)checkNode:(id)a3 connectedNodes:(id)a4 disconnectedNodes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 hex];
  v12 = +[NSMutableSet set];
  id v13 = operator new(8uLL);
  *id v13 = v11;
  id v14 = v13 + 1;
  __src = v13 + 1;
  v31 = v13 + 1;
  std::string __p = v13;
  while (1)
  {
    uint64_t v15 = *v13;
    int64_t v16 = v14 - (unsigned char *)(v13 + 1);
    if (v14 != (unsigned char *)(v13 + 1)) {
      memmove(v13, v13 + 1, v14 - (unsigned char *)(v13 + 1));
    }
    __src = (char *)v13 + v16;
    id v17 = [(CSLHexAppGraph *)self nodeAtHex:v15];
    if (!v17 || ([v12 containsObject:v17] & 1) != 0) {
      goto LABEL_15;
    }
    if (!v15 || [v9 containsObject:v17])
    {
      [v9 unionSet:v12];
      [v12 removeAllObjects];
      BOOL v25 = 1;
      goto LABEL_19;
    }
    if ([v10 containsObject:v17]) {
      break;
    }
    [v12 addObject:v17];
    unint64_t v18 = (v15 & 0xFFFFFFFF00000000) + 0x100000000;
    uint64_t v19 = (v15 - 1);
    unint64_t v20 = v18 | v19;
    uint64_t v21 = (v15 + 1);
    v32[0] = v18 & 0xFFFFFFFF00000000 | v15;
    v32[1] = v21 | v15 & 0xFFFFFFFF00000000;
    unint64_t v22 = (v15 & 0xFFFFFFFF00000000) - 0x100000000;
    v32[2] = v22 | v21;
    v32[3] = v22 & 0xFFFFFFFF00000000 | v15;
    v32[4] = v19 | v15 & 0xFFFFFFFF00000000;
    v32[5] = v20;
    sub_18778((uint64_t)v27, (int *)v32, 6);
    if (v28)
    {
      uint64_t v23 = 0;
      uint64_t v24 = v28;
      do
      {
        ++v23;
        uint64_t v24 = (void *)*v24;
      }
      while (v24);
    }
    else
    {
      uint64_t v23 = 0;
    }
    sub_196FC((uint64_t)&__p, (char *)__src, v28, 0, v23);
    sub_18C64((uint64_t)v27);
LABEL_15:

    id v13 = __p;
    id v14 = __src;
    if (__p == __src)
    {
      BOOL v25 = 0;
      goto LABEL_20;
    }
  }
  BOOL v25 = 0;
LABEL_19:

LABEL_20:
  [v10 unionSet:v12];
  if (__p)
  {
    __src = __p;
    operator delete(__p);
  }

  return v25;
}

- (BOOL)isLonelyHex:(Hex)a3
{
  if (self->_isVerticalOnly) {
    return 0;
  }
  unsigned int r = a3.r;
  int v4 = a3.r + a3.q;
  if (a3.q >= 0) {
    unsigned int q = a3.q;
  }
  else {
    unsigned int q = -a3.q;
  }
  if (v4 < 0) {
    int v4 = -v4;
  }
  if (a3.r < 0) {
    unsigned int r = -a3.r;
  }
  int v6 = q <= r ? r : q;
  BOOL v7 = v4 >= r && v4 >= q;
  unsigned int v8 = v7 ? v4 : v6;
  return v8 >= 2
      && -[CSLHexAppGraph neighborCountOfHex:upToMinimumNeighbors:withinRange:](self, "neighborCountOfHex:upToMinimumNeighbors:withinRange:") < 2;
}

- (void)collapseLonelyNodes:(id)a3
{
  id v6 = a3;
  int v4 = +[NSMutableSet set];
  id v5 = +[NSMutableSet set];
  [(CSLHexAppGraph *)self collapseLonelyNodes:v6 connectedNodes:v4 disconnectedNodes:v5];
}

- (void)collapseLonelyNodes:(id)a3 connectedNodes:(id)a4 disconnectedNodes:(id)a5
{
  id v77 = a3;
  id v78 = a4;
  id v79 = a5;
  unsigned int v8 = +[NSMutableSet set];
  v75 = (int *)&v85;
  while (objc_msgSend(v77, "count", v75))
  {
    id v9 = [v77 anyObject];
    long long v93 = 0u;
    long long v92 = 0u;
    long long v91 = 0u;
    long long v90 = 0u;
    id v10 = v77;
    id v11 = [v10 countByEnumeratingWithState:&v90 objects:v96 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v91;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v91 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          unint64_t v15 = (unint64_t)[v14 hex];
          unint64_t v16 = HIDWORD(v15);
          int v17 = HIDWORD(v15) + v15;
          if ((v15 & 0x80000000) == 0) {
            unsigned int v18 = v15;
          }
          else {
            unsigned int v18 = -(int)v15;
          }
          if (v17 < 0) {
            int v17 = -v17;
          }
          if ((v15 & 0x8000000000000000) != 0) {
            LODWORD(v16) = -HIDWORD(v15);
          }
          if (v18 <= v16) {
            unsigned int v19 = v16;
          }
          else {
            unsigned int v19 = v18;
          }
          if (v17 >= v16 && v17 >= v18) {
            unsigned int v21 = v17;
          }
          else {
            unsigned int v21 = v19;
          }
          unint64_t v22 = (unint64_t)[v9 hex];
          unint64_t v23 = HIDWORD(v22);
          int v24 = HIDWORD(v22) + v22;
          if ((v22 & 0x80000000) == 0) {
            unsigned int v25 = v22;
          }
          else {
            unsigned int v25 = -(int)v22;
          }
          if (v24 < 0) {
            int v24 = -v24;
          }
          if ((v22 & 0x8000000000000000) != 0) {
            LODWORD(v23) = -HIDWORD(v22);
          }
          if (v25 <= v23) {
            unsigned int v26 = v23;
          }
          else {
            unsigned int v26 = v25;
          }
          if (v24 >= v23 && v24 >= v25) {
            unsigned int v28 = v24;
          }
          else {
            unsigned int v28 = v26;
          }
          if (v21 < v28 || v21 == v28 && [v8 containsObject:v14])
          {
            id v29 = v14;

            id v9 = v29;
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v90 objects:v96 count:16];
      }
      while (v11);
    }

    [v10 removeObject:v9];
    [v8 addObject:v9];
    [(CSLHexAppGraph *)self checkNode:v9 connectedNodes:v78 disconnectedNodes:v79];
    if (([v79 containsObject:v9] & 1) == 0
      && !-[CSLHexAppGraph isLonelyHex:](self, "isLonelyHex:", [v9 hex]))
    {
      goto LABEL_147;
    }
    id v76 = [v9 hex];
    [(CSLHexAppGraph *)self removeNodeWithoutReflow:v9];
    [v78 removeObject:v9];
    [v79 removeObject:v9];
    char v88 = 0;
    uint64_t v89 = 0;
    *(void *)std::string buf = [v9 hex];
    v95.__r_.__value_.__r.__words[0] = 0;
    sub_18CB0((uint64_t)v87, (unint64_t *)buf, (uint64_t *)&v95);
    v86[0] = 0;
    *(void *)&v86[4] = 0;
    char v30 = 1;
    do
    {
      *(void *)v86 = sub_12CC4((uint64_t)v87);
      *(_DWORD *)&v86[8] = v31;
      if (!v86[0]) {
        break;
      }
      if (v30)
      {
        int v32 = 6;
      }
      else
      {
        v33 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v86[4]];
        if (v33)
        {
          [(CSLHexAppGraph *)self checkNode:v33 connectedNodes:v78 disconnectedNodes:v79];
          v34 = cslprf_icon_field_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)std::string buf = 138412290;
            *(void *)&uint8_t buf[4] = v33;
            _os_log_debug_impl(&def_1A578, v34, OS_LOG_TYPE_DEBUG, "[less lonely] %@ fall complete", buf, 0xCu);
          }
          int v32 = 7;
        }
        else
        {
          char v88 = 1;
          uint64_t v89 = *(void *)&v86[4];
          v34 = cslprf_icon_field_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v86[4], (std::string *)buf);
            v35 = buf;
            if (buf[23] < 0) {
              v35 = *(unsigned char **)buf;
            }
            LODWORD(v95.__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)v95.__r_.__value_.__r.__words + 4) = (std::string::size_type)v35;
            _os_log_debug_impl(&def_1A578, v34, OS_LOG_TYPE_DEBUG, "[less lonely] %s unoccupied", (uint8_t *)&v95, 0xCu);
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
          }
          int v32 = 0;
        }
      }
      char v30 = 0;
    }
    while (v32 != 7);
    if (v88)
    {
      v36 = cslprf_icon_field_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        sub_A010((int *)&v89, (std::string *)buf);
        v71 = buf;
        if (buf[23] < 0) {
          v71 = *(unsigned char **)buf;
        }
        LODWORD(v95.__r_.__value_.__l.__data_) = 138412546;
        *(std::string::size_type *)((char *)v95.__r_.__value_.__r.__words + 4) = (std::string::size_type)v9;
        WORD2(v95.__r_.__value_.__r.__words[1]) = 2080;
        *(std::string::size_type *)((char *)&v95.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v71;
        _os_log_debug_impl(&def_1A578, v36, OS_LOG_TYPE_DEBUG, "[less lonely] move %@ -> %s", (uint8_t *)&v95, 0x16u);
        if ((buf[23] & 0x80000000) != 0) {
          operator delete(*(void **)buf);
        }
      }

      [(CSLHexAppGraph *)self setNode:v9 toHex:v89];
      [v78 removeAllObjects];
      [v79 removeAllObjects];
    }
    else
    {
      -[CSLHexAppGraph setNode:toHex:](self, "setNode:toHex:", v9, [v9 hex]);
    }
    unsigned int v37 = [(CSLHexAppGraph *)self checkNode:v9 connectedNodes:v78 disconnectedNodes:v79];
    unint64_t v38 = (unint64_t)[v9 hex];
    unint64_t v39 = HIDWORD(v38);
    int v40 = HIDWORD(v38) + v38;
    if ((v38 & 0x80000000) == 0) {
      unsigned int v41 = v38;
    }
    else {
      unsigned int v41 = -(int)v38;
    }
    if (v40 < 0) {
      int v40 = -v40;
    }
    if ((v38 & 0x8000000000000000) != 0) {
      LODWORD(v39) = -HIDWORD(v38);
    }
    if (v41 <= v39) {
      unsigned int v42 = v39;
    }
    else {
      unsigned int v42 = v41;
    }
    if (v40 >= v39 && v40 >= v41) {
      unsigned int v44 = v40;
    }
    else {
      unsigned int v44 = v42;
    }
    if (v44 < 2) {
      goto LABEL_138;
    }
    [(CSLHexAppGraph *)self removeNodeWithoutReflow:v9];
    [v78 removeObject:v9];
    [v79 removeObject:v9];
    uint64_t v45 = 0;
    char v84 = 0;
    uint64_t v85 = 0;
    if (!v37)
    {
LABEL_129:
      [(CSLHexAppGraph *)self removeNodeWithoutReflow:v9];
      [v78 removeAllObjects];
      [v79 removeAllObjects];
      if (v84)
      {
        [(CSLHexAppGraph *)self setNode:v9 toHex:v85];
        if (v45 <= 1) {
          [v10 addObject:v9];
        }
        v65 = cslprf_icon_field_log();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          sub_A010(v75, &v95);
          v72 = "final";
          if (v45 < 2) {
            v72 = "intermediate";
          }
          v73 = &v95;
          if ((v95.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            v73 = (std::string *)v95.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)std::string buf = 136315650;
          *(void *)&uint8_t buf[4] = v72;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v9;
          *(_WORD *)&buf[22] = 2080;
          *(void *)&buf[24] = v73;
          _os_log_debug_impl(&def_1A578, v65, OS_LOG_TYPE_DEBUG, "[lonely %s] move %@ -> %s", buf, 0x20u);
          if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v95.__r_.__value_.__l.__data_);
          }
        }
      }
      else
      {
        v94.__r_.__value_.__r.__words[0] = (std::string::size_type)[(CSLHexAppGraph *)self firstGoodEmptyHex];
        v66 = cslprf_icon_field_log();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          sub_A010((int *)&v94, (std::string *)buf);
          v74 = buf;
          if (buf[23] < 0) {
            v74 = *(unsigned char **)buf;
          }
          LODWORD(v95.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)v95.__r_.__value_.__r.__words + 4) = (std::string::size_type)v9;
          WORD2(v95.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v95.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v74;
          _os_log_debug_impl(&def_1A578, v66, OS_LOG_TYPE_DEBUG, "[should not happen - searched from center] move %@ -> %s", (uint8_t *)&v95, 0x16u);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
        }

        [(CSLHexAppGraph *)self setNode:v9 toHex:v94.__r_.__value_.__r.__words[0]];
      }
      goto LABEL_138;
    }
    uint64_t v46 = 0;
    uint64_t v45 = 0;
    id v82 = [v9 hex];
    int v83 = 0;
    while (1)
    {
      *(void *)v86 = sub_1198C((uint64_t *)&v82);
      *(_DWORD *)&v86[8] = v47;
      if (!v86[0]) {
        break;
      }
      v48 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v86[4]];
      if (v48)
      {
        v49 = cslprf_icon_field_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          v94.__r_.__value_.__r.__words[0] = (std::string::size_type)[v9 hex];
          sub_A010((int *)&v94, (std::string *)buf);
          v60 = buf;
          if (buf[23] < 0) {
            v60 = *(unsigned char **)buf;
          }
          LODWORD(v95.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)v95.__r_.__value_.__r.__words + 4) = (std::string::size_type)v48;
          WORD2(v95.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v95.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v60;
          _os_log_debug_impl(&def_1A578, v49, OS_LOG_TYPE_DEBUG, "[less lonely] %@ occupied (neighbors of %s)", (uint8_t *)&v95, 0x16u);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
        }

        if (v46 >= 1)
        {

          goto LABEL_137;
        }
        ++v46;
      }
      else
      {
        unint64_t v50 = (*(void *)&v86[4] & 0xFFFFFFFF00000000) + 0x100000000;
        uint64_t v51 = (*(_DWORD *)&v86[4] - 1);
        uint64_t v52 = (*(_DWORD *)&v86[4] + 1);
        *(void *)std::string buf = v50 & 0xFFFFFFFF00000000 | *(unsigned int *)&v86[4];
        *(void *)&buf[8] = v52 | *(void *)&v86[4] & 0xFFFFFFFF00000000;
        *(void *)&buf[16] = ((*(void *)&v86[4] & 0xFFFFFFFF00000000) - 0x100000000) | v52;
        *(void *)&buf[24] = ((*(void *)&v86[4] & 0xFFFFFFFF00000000) - 0x100000000) & 0xFFFFFFFF00000000 | *(unsigned int *)&v86[4];
        unint64_t v98 = v51 | *(void *)&v86[4] & 0xFFFFFFFF00000000;
        unint64_t v99 = v50 | v51;
        sub_18778((uint64_t)v81, (int *)buf, 6);
        unsigned int v53 = [(CSLHexAppGraph *)self checkHexes:v81 connectedNodes:v78 disconnectedNodes:v79];
        sub_18C64((uint64_t)v81);
        if (v53)
        {
          uint64_t v54 = [(CSLHexAppGraph *)self directNeighborCountOfHex:*(void *)&v86[4]];
          v55 = cslprf_icon_field_log();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v86[4], &v95);
            if ((v95.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              v63 = &v95;
            }
            else {
              v63 = (std::string *)v95.__r_.__value_.__r.__words[0];
            }
            id v80 = [v9 hex];
            sub_A010((int *)&v80, &v94);
            v64 = &v94;
            if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v64 = (std::string *)v94.__r_.__value_.__r.__words[0];
            }
            *(_DWORD *)std::string buf = 136315650;
            *(void *)&uint8_t buf[4] = v63;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v54;
            *(_WORD *)&buf[18] = 2080;
            *(void *)&buf[20] = v64;
            _os_log_debug_impl(&def_1A578, v55, OS_LOG_TYPE_DEBUG, "[less lonely] %s has %d neighbors (neighbors of %s)", buf, 0x1Cu);
            if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v94.__r_.__value_.__l.__data_);
            }
            if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v95.__r_.__value_.__l.__data_);
            }
          }

          if (v54 >= 1)
          {
            if (v54 > v45
              || v54 == v45
              && (!v84
               || (int8x8_t v57 = (int8x8_t)vabs_s32(vadd_s32((int32x2_t)__PAIR64__(HIDWORD(v85), *(unsigned int *)&v86[8]), (int32x2_t)__PAIR64__(v85, *(unsigned int *)&v86[4]))), v58 = (int8x8_t)vmax_u32((uint32x2_t)vabs_s32((int32x2_t)__PAIR64__(v85, *(unsigned int *)&v86[4])), (uint32x2_t)vabs_s32((int32x2_t)__PAIR64__(HIDWORD(v85), *(unsigned int *)&v86[8]))), v59 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)v58, (uint32x2_t)v57), v58, v57), (vcgt_u32((uint32x2_t)vdup_lane_s32(v59, 1), (uint32x2_t)v59).u8[0] & 1) != 0)))
            {
              char v84 = 1;
              uint64_t v85 = *(void *)&v86[4];
              goto LABEL_101;
            }
          }
        }
        else
        {
          v56 = cslprf_icon_field_log();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v86[4], (std::string *)buf);
            if (buf[23] >= 0) {
              v61 = buf;
            }
            else {
              v61 = *(unsigned char **)buf;
            }
            id v80 = [v9 hex];
            sub_A010((int *)&v80, &v95);
            v62 = &v95;
            if ((v95.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              v62 = (std::string *)v95.__r_.__value_.__r.__words[0];
            }
            LODWORD(v94.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)v94.__r_.__value_.__r.__words + 4) = (std::string::size_type)v61;
            WORD2(v94.__r_.__value_.__r.__words[1]) = 2080;
            *(std::string::size_type *)((char *)&v94.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v62;
            _os_log_debug_impl(&def_1A578, v56, OS_LOG_TYPE_DEBUG, "[less lonely] %s not connected (neighbors of %s)", (uint8_t *)&v94, 0x16u);
            if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v95.__r_.__value_.__l.__data_);
            }
            if ((buf[23] & 0x80000000) != 0) {
              operator delete(*(void **)buf);
            }
          }
        }
      }
      uint64_t v54 = v45;
LABEL_101:

      uint64_t v45 = v54;
    }
    if (v46 <= 1) {
      goto LABEL_129;
    }
LABEL_137:
    -[CSLHexAppGraph setNode:toHex:](self, "setNode:toHex:", v9, [v9 hex]);
LABEL_138:
    *(void *)std::string buf = v76;
    *(_DWORD *)&buf[8] = 0;
    while (1)
    {
      *(void *)v86 = sub_1198C((uint64_t *)buf);
      *(_DWORD *)&v86[8] = v67;
      if (!v86[0]) {
        break;
      }
      uint64_t v68 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v86[4]];
      v69 = (void *)v68;
      if (v68) {
        BOOL v70 = v68 == (void)v9;
      }
      else {
        BOOL v70 = 1;
      }
      if (!v70)
      {
        if ([(CSLHexAppGraph *)self isLonelyHex:*(void *)&v86[4]]) {
          [v10 addObject:v69];
        }
      }
    }
LABEL_147:
  }
}

- (void)move343Node:(id)a3 toHex:(Hex)a4 final:(BOOL)a5
{
  BOOL v5 = a5;
  Hex v52 = a4;
  id v8 = a3;
  id v9 = cslprf_icon_field_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    sub_A010((int *)&v52, &buf);
    if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    CFStringRef v40 = &stru_3CFC8;
    LODWORD(__p.__r_.__value_.__l.__data_) = 138412802;
    if (v5) {
      CFStringRef v40 = @"(final)";
    }
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
    WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
    *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)p_buf;
    HIWORD(__p.__r_.__value_.__r.__words[2]) = 2112;
    uint64_t v54 = (void *)v40;
    _os_log_debug_impl(&def_1A578, v9, OS_LOG_TYPE_DEBUG, "[343 move] consider move %@ -> %s %@", (uint8_t *)&__p, 0x20u);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
  }

  [(NSMutableSet *)self->_changedNodes removeAllObjects];
  id v10 = [v8 hex];
  if (*(id *)&v52 != v10 && v52.r >= -2 && (v52.r + 2 * v52.q + 3) <= 6)
  {
    [(CSLHexAppGraph *)self revertMove];
    id v11 = [v8 hex];
    [(CSLHexAppGraph *)self removeNodeWithoutReflow:v8];
    uint64_t v12 = cslprf_icon_field_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      sub_A010((int *)&v52, &buf);
      if ((buf.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned int v41 = &buf;
      }
      else {
        unsigned int v41 = (std::string *)buf.__r_.__value_.__r.__words[0];
      }
      CFStringRef v42 = &stru_3CFC8;
      LODWORD(__p.__r_.__value_.__l.__data_) = 138412802;
      if (v5) {
        CFStringRef v42 = @"(final)";
      }
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2080;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v41;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2112;
      uint64_t v54 = (void *)v42;
      _os_log_debug_impl(&def_1A578, v12, OS_LOG_TYPE_DEBUG, "[343 move] WILL move %@ -> %s %@", (uint8_t *)&__p, 0x20u);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
    }

    id v13 = self;
    uint64_t v51 = v13;
    int q = v52.q;
    int r = v52.r;
    id v16 = [v8 hex];
    if (r == HIDWORD(v11)) {
      BOOL v17 = q > (int)v11;
    }
    else {
      BOOL v17 = r > SHIDWORD(v11);
    }
    uint64_t v50 = (uint64_t)v52;
    id v18 = v8;
    unsigned int v19 = v18;
    if (v17)
    {
      Hex v49 = v52;
      unint64_t v20 = v18;
      do
      {
        uint64_t v21 = sub_13440((signed int *)&v49);
        if (v21)
        {
          uint64_t v50 = __PAIR64__(v22, HIDWORD(v21));
          int v24 = [(CSLHexAppGraph *)v13 nodeAtHex:__PAIR64__(v22, HIDWORD(v21))];
          sub_134CC((id *)&v51, v20, v50, v24);
        }
        else
        {
          unint64_t v23 = cslprf_icon_field_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v50, &__p);
            p_p = &__p;
            if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
            }
            LODWORD(buf.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
            WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
            *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v20;
            _os_log_debug_impl(&def_1A578, v23, OS_LOG_TYPE_DEBUG, "[343 move] reverse enumerator ended after:%s unplacedNode:%@", (uint8_t *)&buf, 0x16u);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }

          int v24 = 0;
          if (v20 && v20 != v19)
          {
            v43 = +[NSString stringWithFormat:@"integrity error, reverse iterator reached end with unplaced node:%@", v20];
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              NSStringFromSelector(a2);
              id v45 = (id)objc_claimAutoreleasedReturnValue();
              uint64_t v46 = (objc_class *)objc_opt_class();
              int v47 = NSStringFromClass(v46);
              LODWORD(__p.__r_.__value_.__l.__data_) = 138544642;
              *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v45;
              WORD2(__p.__r_.__value_.__r.__words[1]) = 2114;
              *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v47;
              HIWORD(__p.__r_.__value_.__r.__words[2]) = 2048;
              uint64_t v54 = v13;
              __int16 v55 = 2114;
              CFStringRef v56 = @"CSLHexAppGraph.mm";
              __int16 v57 = 1024;
              int v58 = 771;
              __int16 v59 = 2114;
              v60 = v43;
              _os_log_error_impl(&def_1A578, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&__p, 0x3Au);
            }
            [v43 UTF8String];
            uint64_t v48 = _bs_set_crash_log_message();
            sub_279F0(v48);
          }
        }

        BOOL v25 = SHIDWORD(v50) > SHIDWORD(v16);
        if (HIDWORD(v50) == HIDWORD(v16)) {
          BOOL v25 = (int)v50 > (int)v16;
        }
        BOOL v26 = !v25 || v24 == 0;
        unint64_t v20 = v24;
      }
      while (!v26);
    }
    else
    {
      unint64_t v28 = (unint64_t)[v18 hex];
      int v29 = v28;
      unint64_t v30 = HIDWORD(v28);
      __p.__r_.__value_.__l.__data_ = (std::string::pointer)v52;
      do
      {
        uint64_t v31 = sub_10B68((unsigned int *)&__p);
        uint64_t v50 = __PAIR64__(v32, HIDWORD(v31));
        int v24 = [(CSLHexAppGraph *)v13 nodeAtHex:__PAIR64__(v32, HIDWORD(v31))];
        sub_134CC((id *)&v51, v19, v50, v24);

        BOOL v33 = SHIDWORD(v50) < (int)v30;
        if (HIDWORD(v50) == v30) {
          BOOL v33 = (int)v50 < v29;
        }
        BOOL v34 = !v33 || v24 == 0;
        unsigned int v19 = v24;
      }
      while (!v34);
    }
  }
  if (v5) {
    id v35 = 0;
  }
  else {
    id v35 = v8;
  }
  [(CSLHexAppGraph *)self integrityCheckIgnoringNode:v35 shouldCheckNeighbors:0];
  [(CSLHexAppGraph *)self collapseAll343Holes];
  [(CSLHexAppGraph *)self integrityCheckIgnoringNode:v35 shouldCheckNeighbors:1];
  if ([(NSMutableSet *)self->_changedNodes count])
  {
    v36 = cslprf_icon_field_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      [(NSMutableSet *)self->_changedNodes count];
      [(CSLHexAppGraph *)self delegate];
      objc_claimAutoreleasedReturnValue();
      sub_279A0();
    }

    unsigned int v37 = [(CSLHexAppGraph *)self delegate];
    unint64_t v38 = [(NSMutableSet *)self->_changedNodes allObjects];
    [v37 hexAppGraph:self addedNodes:0 removedNodes:0 movedNodes:v38];
  }
}

- (void)moveNode:(id)a3 toHex:(Hex)a4 final:(BOOL)a5
{
  BOOL v5 = a5;
  id v51 = (id)a4;
  id v8 = a3;
  id v9 = v8;
  if (!self->_isVerticalOnly)
  {
    if (!*(void *)&a4 || ![v8 hex])
    {
      id v11 = cslprf_icon_field_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        sub_A010((int *)&v51, (std::string *)v53);
        sub_279F8();
      }
      goto LABEL_56;
    }
    [(NSMutableSet *)self->_changedNodes removeAllObjects];
    if (v51 == [v9 hex])
    {
      if (v5)
      {
        id v10 = cslprf_icon_field_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_27A9C();
        }

        id v11 = +[NSMutableSet set];
        [v11 addObject:v9];
        goto LABEL_49;
      }
    }
    else
    {
      [(CSLHexAppGraph *)self revertMove];
      uint64_t v12 = cslprf_icon_field_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        sub_A010((int *)&v51, (std::string *)&v59);
        if (v60[7] >= 0) {
          v43 = &v59;
        }
        else {
          v43 = (long long *)v59;
        }
        CFStringRef v44 = &stru_3CFC8;
        *(_DWORD *)unsigned int v53 = 138412802;
        if (v5) {
          CFStringRef v44 = @"(final)";
        }
        *(void *)&v53[4] = v9;
        *(_WORD *)uint64_t v54 = 2080;
        *(void *)&v54[2] = v43;
        *(_WORD *)&v54[10] = 2112;
        *(void *)&v54[12] = v44;
        _os_log_debug_impl(&def_1A578, v12, OS_LOG_TYPE_DEBUG, "WILL move %@ -> %s %@", v53, 0x20u);
        if ((v60[7] & 0x80000000) != 0) {
          operator delete((void *)v59);
        }
      }

      id v13 = [v9 hex];
      sub_18DB8((uint64_t *)&v59, (uint64_t)v51, (uint64_t)v13);
      v50[0] = 0;
      *(void *)&v50[4] = 0;
      do
      {
        unint64_t v14 = sub_13F4C(&v59);
        *(void *)uint64_t v50 = v14;
        *(_DWORD *)&v50[8] = v15;
        uint64_t v16 = v14;
        if (!(_BYTE)v14 || !HIDWORD(v14) && !v15) {
          break;
        }
        BOOL v17 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v50[4]];
        BOOL v18 = v17 == 0;
      }
      while (!v18);
      [(CSLHexAppGraph *)self removeNodeWithoutReflow:v9];
      if (v16)
      {
        id v11 = +[NSMutableSet set];
        [(CSLHexAppGraph *)self collapseToHex:v13 ignoringNode:v9];
        unsigned int v19 = [(CSLHexAppGraph *)self nodeAtHex:v51];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          unsigned int v41 = cslprf_icon_field_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v51, (std::string *)v53);
            sub_27B74();
          }

          [(CSLHexAppGraph *)self setNode:v9 toHex:v51];
          if (v5)
          {
            CFStringRef v42 = cslprf_icon_field_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
              sub_27B08();
            }

            [v11 addObject:v9];
          }
        }
        else
        {
          *(void *)unsigned int v53 = v51;
          v53[8] = 1;
          *(void *)uint64_t v54 = v51;
          *(void *)&v54[8] = v51;
          *(void *)&v54[16] = v51;
          __int16 v55 = v51;
          CFStringRef v56 = v51;
          __int16 v57 = v51;
          unint64_t v58 = 0xFFFFFFFF00000000;
          char v48 = 0;
          uint64_t v49 = 0;
          while (1)
          {
            *(void *)uint64_t v50 = sub_13FE4((uint64_t)v53);
            *(_DWORD *)&v50[8] = v21;
            if (!v50[0]) {
              break;
            }
            unsigned int v22 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v50[4]];
            BOOL v23 = v22 == 0;

            if (v23)
            {
              char v48 = 1;
              uint64_t v49 = *(void *)&v50[4];
              int v24 = cslprf_icon_field_log();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                sub_A010((int *)&v49, &v47);
                sub_27BF0();
              }

              break;
            }
          }
          sub_18DB8((uint64_t *)buf, (uint64_t)v51, v49);
          long long v59 = *(_OWORD *)buf;
          *(_OWORD *)v60 = *(_OWORD *)&buf[16];
          *(_OWORD *)&v60[12] = *(_OWORD *)&buf[28];
          id v25 = v9;
          *(void *)&long long v26 = 138412290;
          long long v45 = v26;
          while (1)
          {
            *(void *)uint64_t v50 = sub_13F4C(&v59);
            *(_DWORD *)&v50[8] = v27;
            if (!v50[0]) {
              break;
            }
            uint64_t v28 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v50[4]];
            int v29 = cslprf_icon_field_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              sub_A010((int *)&v50[4], &__p);
              p_p = &__p;
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)std::string buf = 138412802;
              *(void *)&uint8_t buf[4] = v28;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v25;
              *(_WORD *)&buf[22] = 2080;
              *(void *)&buf[24] = p_p;
              _os_log_debug_impl(&def_1A578, v29, OS_LOG_TYPE_DEBUG, "[push up] removed %@; move %@ -> %s", buf, 0x20u);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(__p.__r_.__value_.__l.__data_);
              }
            }

            [(CSLHexAppGraph *)self setNode:v25 toHex:*(void *)&v50[4]];
            if (!v28)
            {
              unint64_t v30 = cslprf_icon_field_log();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)std::string buf = v45;
                *(void *)&uint8_t buf[4] = v25;
                _os_log_debug_impl(&def_1A578, v30, OS_LOG_TYPE_DEBUG, "[lonely?] add %@", buf, 0xCu);
              }

              [v11 addObject:v25];
            }

            id v25 = (id)v28;
          }
        }
        goto LABEL_49;
      }
      id v32 = v9;
      *(_DWORD *)&v60[8] = 0;
      *(void *)v60 = v59;
      while (1)
      {
        *(void *)uint64_t v50 = sub_13F4C(&v59);
        *(_DWORD *)&v50[8] = v33;
        if (!v50[0]) {
          break;
        }
        uint64_t v34 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v50[4]];
        id v35 = cslprf_icon_field_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          sub_A010((int *)&v50[4], (std::string *)buf);
          v36 = buf;
          if (buf[23] < 0) {
            v36 = *(unsigned char **)buf;
          }
          *(_DWORD *)unsigned int v53 = 138412802;
          *(void *)&v53[4] = v34;
          *(_WORD *)uint64_t v54 = 2112;
          *(void *)&v54[2] = v32;
          *(_WORD *)&v54[10] = 2080;
          *(void *)&v54[12] = v36;
          _os_log_debug_impl(&def_1A578, v35, OS_LOG_TYPE_DEBUG, "[simple shift] removed %@; move %@ -> %s", v53, 0x20u);
          if ((buf[23] & 0x80000000) != 0) {
            operator delete(*(void **)buf);
          }
        }

        [(CSLHexAppGraph *)self setNode:v32 toHex:*(void *)&v50[4]];
        id v32 = (id)v34;
      }
    }
    id v11 = 0;
LABEL_49:
    if (v5) {
      unsigned int v37 = 0;
    }
    else {
      unsigned int v37 = v9;
    }
    -[CSLHexAppGraph integrityCheckIgnoringNode:shouldCheckNeighbors:](self, "integrityCheckIgnoringNode:shouldCheckNeighbors:", v37, 0, v45);
    [(CSLHexAppGraph *)self collapseLonelyNodes:v11];
    [(CSLHexAppGraph *)self integrityCheckIgnoringNode:v37 shouldCheckNeighbors:1];
    if ([(NSMutableSet *)self->_changedNodes count])
    {
      unint64_t v38 = cslprf_icon_field_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        [(NSMutableSet *)self->_changedNodes count];
        [(CSLHexAppGraph *)self delegate];
        objc_claimAutoreleasedReturnValue();
        sub_27A4C();
      }

      unint64_t v39 = [(CSLHexAppGraph *)self delegate];
      CFStringRef v40 = [(NSMutableSet *)self->_changedNodes allObjects];
      [v39 hexAppGraph:self addedNodes:0 removedNodes:0 movedNodes:v40];
    }
LABEL_56:

    goto LABEL_57;
  }
  [(CSLHexAppGraph *)self move343Node:v8 toHex:a4 final:v5];
LABEL_57:
}

- (void)commitMovedNode:(id)a3 withReason:(unint64_t)a4
{
  id v10 = a3;
  for (i = (id *)self->_nodes.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v7 = i[3];
    if ([v7 moved])
    {
      if (v10) {
        BOOL v8 = v7 == v10;
      }
      else {
        BOOL v8 = 1;
      }
      uint64_t v9 = v8;
      [v7 commitHexForReason:a4 isDirect:v9];
    }
  }
  if (v10) {
    [(CSLHexAppGraph *)self setLastReorderReason:a4];
  }
  [(CSLHexAppGraph *)self integrityCheckIgnoringNode:0 shouldCheckNeighbors:1];
}

- (void)revertMove
{
  BOOL v17 = +[NSMutableArray array];
  for (i = self->_nodes.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    int v4 = (void *)i[3];
    if ([v4 moved]) {
      [v17 addObject:v4];
    }
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v17;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (j = 0; j != v6; j = (char *)j + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        [(CSLHexAppGraph *)self removeNodeWithoutReflow:*(void *)(*((void *)&v24 + 1) + 8 * (void)j)];
      }
      id v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v6);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v5;
  id v10 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v12);
        unint64_t v14 = cslprf_icon_field_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          id v18 = [v13 savedHex];
          sub_A010((int *)&v18, &__p);
          p_p = &__p;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)std::string buf = 138412546;
          int v29 = v13;
          __int16 v30 = 2080;
          uint64_t v31 = p_p;
          _os_log_debug_impl(&def_1A578, v14, OS_LOG_TYPE_DEBUG, "reverted %@ -> %s", buf, 0x16u);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }

        -[CSLHexAppGraph setNode:toHex:](self, "setNode:toHex:", v13, [v13 savedHex]);
        uint64_t v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v16 = [v9 countByEnumeratingWithState:&v20 objects:v32 count:16];
      id v10 = v16;
    }
    while (v16);
  }

  [(CSLHexAppGraph *)self integrityCheckIgnoringNode:0 shouldCheckNeighbors:1];
}

- (id)nodeWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLHexAppGraph *)self nodesByBundle];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)containsNodeAtHex:(Hex)a3
{
  Hex v4 = a3;
  return sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v4) != 0;
}

- (id)nodeAtHex:(Hex)a3
{
  Hex v5 = a3;
  unint64_t v3 = (id *)sub_19400(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v5);
  if (v3) {
    unint64_t v3 = (id *)v3[3];
  }

  return v3;
}

- (void)calculateNeighborCounts
{
  sub_19A28(&self->_neighborCounts.__table_.__bucket_list_.__ptr_.__value_);
  self->_BOOL neighborCountValid = 0;
  for (i = self->_nodes.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
    [(CSLHexAppGraph *)self incrementNeighborCountsForHex:i[2]];
  self->_BOOL neighborCountValid = 1;
}

- (void)incrementNeighborCountsForHex:(Hex)a3
{
  Hex v11 = a3;
  int v12 = 0;
  uint64_t v9 = sub_1198C((uint64_t *)&v11);
  int v10 = v4;
  if ((_BYTE)v9)
  {
    p_neighborCounts = &self->_neighborCounts;
    do
    {
      id v6 = sub_19400(p_neighborCounts, (int *)&v9 + 1);
      if (v6)
      {
        ++*((_DWORD *)v6 + 6);
      }
      else
      {
        int v8 = 1;
        sub_19A90((uint64_t)p_neighborCounts, (int *)&v9 + 1, (uint64_t *)((char *)&v9 + 4), &v8);
      }
      uint64_t v9 = sub_1198C((uint64_t *)&v11);
      int v10 = v7;
    }
    while ((_BYTE)v9);
  }
}

- (void)decrementNeighborCountsForHex:(Hex)a3
{
  Hex v10 = a3;
  int v11 = 0;
  uint64_t v8 = sub_1198C((uint64_t *)&v10);
  int v9 = v4;
  if ((_BYTE)v8)
  {
    p_neighborCounts = &self->_neighborCounts;
    do
    {
      id v6 = sub_19400(p_neighborCounts, (int *)&v8 + 1);
      if (v6) {
        --*((_DWORD *)v6 + 6);
      }
      uint64_t v8 = sub_1198C((uint64_t *)&v10);
      int v9 = v7;
    }
    while ((_BYTE)v8);
  }
}

- (int64_t)directNeighborCountOfHex:(Hex)a3
{
  return [(CSLHexAppGraph *)self neighborCountOfHex:a3 upToMinimumNeighbors:0x7FFFFFFFFFFFFFFFLL withinRange:1];
}

- (BOOL)hex:(Hex)a3 hasAtLeastNNearbyNodes:(int64_t)a4 withinRange:(unint64_t)a5
{
  return [(CSLHexAppGraph *)self neighborCountOfHex:a3 upToMinimumNeighbors:a4 withinRange:a5] >= a4;
}

- (void)resetToDefaults:(id)a3
{
  id v4 = a3;
  [v4 allNodes];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        Hex v10 = [v9 bundleIdentifier];
        int v11 = [(CSLHexAppGraph *)self nodeWithBundleIdentifier:v10];
        BOOL v12 = v11 == 0;

        if (v12) {
          [v4 removeNode:v9];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  [(CSLHexAppGraph *)self allNodes];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        BOOL v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * (void)j), "bundleIdentifier", (void)v22);
        id v18 = [v4 nodeWithBundleIdentifier:v17];
        BOOL v19 = v18 == 0;

        if (v19) {
          id v20 = [v4 addNodeWithBundleIdentifier:v17];
        }
      }
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v14);
  }

  id v21 = [(CSLHexAppGraph *)self changeToMatch:v4];
}

- (id)changeToMatch:(id)a3
{
  id v4 = a3;
  if ([v4 integrityCheck])
  {
    self->_BOOL isVerticalOnly = [v4 isVerticalOnly];
    CFStringRef v40 = +[NSMutableArray array];
    unsigned int v41 = +[NSMutableArray array];
    unint64_t v39 = +[NSMutableArray array];
    [(CSLHexAppGraph *)self allNodes];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v57;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          int v9 = [v8 bundleIdentifier];
          Hex v10 = [v4 nodeWithBundleIdentifier:v9];
          BOOL v11 = v10 == 0;

          if (v11)
          {
            BOOL v12 = [(CSLHexAppGraph *)self nodesByBundle];
            id v13 = [v8 bundleIdentifier];
            [v12 removeObjectForKey:v13];

            -[CSLHexAppGraph removeNodeObjectForKey:](self, "removeNodeObjectForKey:", [v8 hex]);
            [v41 addObject:v8];
          }
        }
        id v5 = [obj countByEnumeratingWithState:&v56 objects:v63 count:16];
      }
      while (v5);
    }

    [v4 allNodes];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v42 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v42 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v53;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v53 != v15) {
            objc_enumerationMutation(v42);
          }
          BOOL v17 = *(void **)(*((void *)&v52 + 1) + 8 * (void)j);
          id v18 = [v17 bundleIdentifier];
          BOOL v19 = [(CSLHexAppGraph *)self nodeWithBundleIdentifier:v18];

          if (v19)
          {
            id v20 = [v19 hex];
            if (v20 != [v17 hex])
            {
              -[CSLHexAppGraph removeNodeObjectForKey:](self, "removeNodeObjectForKey:", [v19 hex]);
              objc_msgSend(v19, "setHex:", objc_msgSend(v17, "hex"));
              [v39 addObject:v19];
            }
          }
          else
          {
            id v21 = [v17 copy];
            [v40 addObject:v21];
          }
        }
        id v14 = [v42 countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v14);
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v22 = v39;
    id v23 = [v22 countByEnumeratingWithState:&v48 objects:v61 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v49;
      do
      {
        for (k = 0; k != v23; k = (char *)k + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v22);
          }
          -[CSLHexAppGraph setNodeObject:forKey:](self, "setNodeObject:forKey:", *(void *)(*((void *)&v48 + 1) + 8 * (void)k), [*(id *)(*((void *)&v48 + 1) + 8 * (void)k) hex]);
        }
        id v23 = [v22 countByEnumeratingWithState:&v48 objects:v61 count:16];
      }
      while (v23);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v40;
    id v27 = [v26 countByEnumeratingWithState:&v44 objects:v60 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v45;
      do
      {
        for (m = 0; m != v27; m = (char *)m + 1)
        {
          if (*(void *)v45 != v28) {
            objc_enumerationMutation(v26);
          }
          __int16 v30 = *(void **)(*((void *)&v44 + 1) + 8 * (void)m);
          -[CSLHexAppGraph setNodeObject:forKey:](self, "setNodeObject:forKey:", v30, [v30 hex]);
          uint64_t v31 = [(CSLHexAppGraph *)self nodesByBundle];
          id v32 = [v30 bundleIdentifier];
          [v31 setObject:v30 forKey:v32];
        }
        id v27 = [v26 countByEnumeratingWithState:&v44 objects:v60 count:16];
      }
      while (v27);
    }

    [(CSLHexAppGraph *)self integrityCheckIgnoringNode:0 shouldCheckNeighbors:1];
    -[CSLHexAppGraph setLastReorderReason:](self, "setLastReorderReason:", [v4 lastReorderReason]);
    if ([v26 count] || objc_msgSend(v41, "count") || objc_msgSend(v22, "count"))
    {
      int v33 = [(CSLHexAppGraph *)self delegate];
      [v33 hexAppGraph:self addedNodes:v26 removedNodes:v41 movedNodes:v22];
    }
    uint64_t v34 = [v26 firstObject];

    id v35 = v41;
    goto LABEL_45;
  }
  v36 = cslprf_icon_field_log();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    [v4 abbreviatedDescription];
    objc_claimAutoreleasedReturnValue();
    sub_27C4C();
  }

  unsigned int v37 = CSLDiagnosticFilename(@"InvalidIconGraph");
  CSLDiagnosticFileURLWithFilename(v37);
  id v26 = (id)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    id v35 = [v4 description];
    uint64_t v34 = 0;
    [v35 writeToURL:v26 atomically:1 encoding:4 error:0];
LABEL_45:

    goto LABEL_46;
  }
  uint64_t v34 = 0;
LABEL_46:

  return v34;
}

- (float)normalizedHorizontalRadius
{
  return self->_normalizedHorizontalRadius;
}

- (float)normalizedVerticalRadius
{
  return self->_normalizedVerticalRadius;
}

- (float)normalizedVerticalTop
{
  return self->_normalizedVerticalTop;
}

- (float)normalizedVerticalBottom
{
  return self->_normalizedVerticalBottom;
}

- (int)rowCount
{
  return self->_rowCount;
}

- (void)updateNormalizedRadius
{
  if (self->_normalizedRadiusDirty)
  {
    self->_normalizedHorizontalRadius = 0.0;
    self->_normalizedVerticalRadius = 0.0;
    next = self->_nodes.__table_.__p1_.__value_.__next_;
    if (next)
    {
      int v3 = 0;
      int v4 = 0;
      float normalizedVerticalTop = self->_normalizedVerticalTop;
      float normalizedVerticalBottom = self->_normalizedVerticalBottom;
      float v7 = 0.0;
      float v8 = 0.0;
      do
      {
        int v9 = next[5];
        float v10 = fabsf((float)((float)((float)v9 * 0.5) + (float)(int)next[4]) * 1.7321);
        if (v10 > v8)
        {
          self->_normalizedHorizontalRadius = v10;
          float v8 = v10;
        }
        float v11 = (float)v9 * 1.5;
        float v12 = fabsf(v11);
        if (v12 > v7)
        {
          self->_normalizedVerticalRadius = v12;
          float v7 = v12;
        }
        if (v11 < normalizedVerticalTop)
        {
          self->_float normalizedVerticalTop = v11;
          float normalizedVerticalTop = (float)v9 * 1.5;
        }
        if (v11 > normalizedVerticalBottom)
        {
          self->_float normalizedVerticalBottom = v11;
          float normalizedVerticalBottom = (float)v9 * 1.5;
        }
        if (v9 < v3) {
          int v3 = v9;
        }
        if (v9 > v4) {
          int v4 = v9;
        }
        next = *(_DWORD **)next;
      }
      while (next);
      int v13 = v4 - v3 + 1;
    }
    else
    {
      int v13 = 1;
    }
    self->_rowCount = v13;
    self->_normalizedRadiusDirty = 0;
  }
}

- (int64_t)neighborCountOfHex:(Hex)a3 upToMinimumNeighbors:(int64_t)a4 withinRange:(unint64_t)a5
{
  Hex v21 = a3;
  if (a5 == 1 && self->_neighborCountValid)
  {
    float v7 = sub_19400(&self->_neighborCounts.__table_.__bucket_list_.__ptr_.__value_, (int *)&v21);
    if (v7) {
      return *((int *)v7 + 6);
    }
    return 0;
  }
  Hex v15 = a3;
  int v16 = 3 * (a5 + a5 * a5);
  uint64_t v17 = 0x100000000;
  int v18 = 0;
  Hex v19 = a3;
  int v20 = 0;
  uint64_t v13 = sub_BC88(&v15);
  int v14 = v9;
  if (!(_BYTE)v13) {
    return 0;
  }
  int64_t v8 = 0;
  p_nodes = &self->_nodes;
  do
  {
    if (sub_19400(p_nodes, (int *)&v13 + 1))
    {
      if (++v8 >= a4) {
        break;
      }
    }
    uint64_t v13 = sub_BC88(&v15);
    int v14 = v11;
  }
  while ((_BYTE)v13);
  return v8;
}

- (void)moveNode:(id)a3 toHex:(Hex)a4
{
  id v6 = a3;
  -[CSLHexAppGraph removeNodeObjectForKey:](self, "removeNodeObjectForKey:", [v6 hex]);
  [v6 setHex:a4];
  [(CSLHexAppGraph *)self setNodeObject:v6 forKey:a4];
  [(NSMutableSet *)self->_changedNodes addObject:v6];
}

- (void)setNode:(id)a3 toHex:(Hex)a4
{
  id v6 = a3;
  [v6 setHex:a4];
  [(CSLHexAppGraph *)self setNodeObject:v6 forKey:a4];
  [(NSMutableSet *)self->_changedNodes addObject:v6];
}

- (void)setNodeObject:(id)a3 forKey:(Hex)a4
{
  Hex v6 = a4;
  id v5 = a3;
  float v7 = &v6;
  sub_19CCC((uint64_t)&self->_nodes, (int *)&v6, (uint64_t)&unk_2E8A4, (void **)&v7)[3] = v5;
  *(_WORD *)&self->_BOOL neighborCountValid = 256;
}

- (void)removeNodeObjectForKey:(Hex)a3
{
  Hex v4 = a3;
  sub_19EF8(&self->_nodes.__table_.__bucket_list_.__ptr_.__value_, (int *)&v4);
  *(_WORD *)&self->_BOOL neighborCountValid = 256;
}

- (BOOL)integrityCheck
{
  return [(CSLHexAppGraph *)self integrityCheckIgnoringNode:0 shouldCheckNeighbors:1];
}

- (BOOL)integrityCheckIgnoringNode:(id)a3 shouldCheckNeighbors:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  float v7 = +[NSMutableSet set];
  long long v48 = +[NSMutableSet set];
  long long v49 = +[NSMutableSet set];
  next = self->_nodes.__table_.__p1_.__value_.__next_;
  if (!next)
  {
LABEL_36:
    *(void *)long long v57 = 0;
    *(void *)&v57[8] = v57;
    *(void *)&v57[16] = 0x2020000000;
    v57[24] = 1;
    long long v25 = [(CSLHexAppGraph *)self nodesByBundle];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_15D80;
    v50[3] = &unk_3CC70;
    id v51 = v7;
    id v26 = v6;
    id v52 = v26;
    long long v53 = v57;
    [v25 enumerateKeysAndObjectsUsingBlock:v50];

    if (*(unsigned char *)(*(void *)&v57[8] + 24))
    {
      unint64_t value = self->_nodes.__table_.__p2_.__value_;
      uint64_t v28 = [(CSLHexAppGraph *)self nodesByBundle];
      id v29 = [v28 count];

      if ((id)value == v29 || v26 && (id)(value + 1) == v29)
      {
        BOOL v30 = 1;
LABEL_57:

        _Block_object_dispose(v57, 8);
        goto LABEL_62;
      }
      uint64_t v34 = cslprf_icon_field_log();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        int v43 = self->_nodes.__table_.__p2_.__value_;
        long long v44 = [(CSLHexAppGraph *)self nodesByBundle];
        unsigned int v45 = [v44 count];
        *(_DWORD *)std::string buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v43;
        LOWORD(v59[0]) = 1024;
        *(_DWORD *)((char *)v59 + 2) = v45;
        _os_log_error_impl(&def_1A578, v34, OS_LOG_TYPE_ERROR, "nodes count:%d != nodesByBundleCount:%d", buf, 0xEu);
      }
    }
    BOOL v30 = 0;
    goto LABEL_57;
  }
  while (1)
  {
    long long v56 = next[1];
    id v9 = *((id *)&v56 + 1);
    if (self->_isVerticalOnly && (SDWORD1(v56) < -2 || (DWORD1(v56) + 2 * v56 + 3) >= 7)) {
      break;
    }
    if ([v7 containsObject:v9])
    {
      id v32 = cslprf_icon_field_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_27C94();
      }
      goto LABEL_60;
    }
    [v7 addObject:v9];
    id v11 = [v9 hex];
    if ((id)v56 != v11)
    {
      id v32 = cslprf_icon_field_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        sub_A010((int *)&v56, (std::string *)v57);
        sub_27E4C();
      }
      goto LABEL_60;
    }
    float v12 = [(CSLHexAppGraph *)self nodesByBundle];
    uint64_t v13 = [v9 bundleIdentifier];
    id v14 = [v12 objectForKey:v13];

    if (v14 != v9)
    {
      int v33 = cslprf_icon_field_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_27DDC();
      }

      goto LABEL_52;
    }
    if (v4 && ([v9 isEqual:v6] & 1) == 0)
    {
      if (self->_isVerticalOnly)
      {
        unint64_t v15 = [(CSLHexAppGraph *)self count];
        *(void *)long long v54 = 0xFFFFFFFE00000000;
        if (v15)
        {
          while (1)
          {
            uint64_t v16 = sub_10B68((unsigned int *)v54);
            unint64_t v55 = __PAIR64__(v17, HIDWORD(v16));
            int v18 = [(CSLHexAppGraph *)self nodeAtHex:__PAIR64__(v17, HIDWORD(v16))];
            if (!v18) {
              break;
            }

            if (!--v15) {
              goto LABEL_35;
            }
          }
          uint64_t v31 = cslprf_icon_field_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            sub_A010((int *)&v55, (std::string *)v57);
            sub_27D64();
          }

LABEL_44:
          id v14 = v9;
LABEL_52:

          goto LABEL_61;
        }
      }
      else
      {
        unsigned int v19 = v56;
        unsigned int v20 = DWORD1(v56);
        int v21 = DWORD1(v56) + v56;
        if ((int)v56 < 0) {
          unsigned int v19 = -(int)v56;
        }
        if (v21 < 0) {
          int v21 = -v21;
        }
        if (SDWORD1(v56) < 0) {
          unsigned int v20 = -DWORD1(v56);
        }
        if (v19 <= v20) {
          unsigned int v22 = v20;
        }
        else {
          unsigned int v22 = v19;
        }
        if (v21 >= v20 && v21 >= v19) {
          unsigned int v24 = v21;
        }
        else {
          unsigned int v24 = v22;
        }
        if (v24 >= 2
          && ![(CSLHexAppGraph *)self hex:(void)v56 hasAtLeastNNearbyNodes:2 withinRange:1])
        {
          unsigned int v37 = +[NSMutableArray arrayWithCapacity:6];
          *(void *)std::string buf = v56;
          v59[0] = 0;
          while (1)
          {
            *(void *)long long v54 = sub_1198C((uint64_t *)buf);
            *(_DWORD *)&v54[8] = v38;
            if (!v54[0]) {
              break;
            }
            unint64_t v39 = [(CSLHexAppGraph *)self nodeAtHex:*(void *)&v54[4]];
            CFStringRef v40 = v39;
            if (v39)
            {
              unsigned int v41 = [v39 description];
              [v37 addObject:v41];
            }
          }
          id v42 = cslprf_icon_field_log();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            unsigned int v46 = [v37 count];
            long long v47 = [v37 componentsJoinedByString:@", "];
            *(_DWORD *)long long v57 = 138543874;
            *(void *)&v57[4] = v9;
            *(_WORD *)&v57[12] = 1024;
            *(_DWORD *)&v57[14] = v46;
            *(_WORD *)&v57[18] = 2114;
            *(void *)&v57[20] = v47;
            _os_log_error_impl(&def_1A578, v42, OS_LOG_TYPE_ERROR, "neighbor check failed %{public}@ has only %d neighbors: %{public}@", v57, 0x1Cu);
          }
          goto LABEL_44;
        }
        if (![(CSLHexAppGraph *)self checkNode:v9 connectedNodes:v49 disconnectedNodes:v48])
        {
          v36 = cslprf_icon_field_log();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            sub_27CFC();
          }

          goto LABEL_44;
        }
      }
    }
LABEL_35:

    next = *(_OWORD **)next;
    if (!next) {
      goto LABEL_36;
    }
  }
  id v32 = cslprf_icon_field_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    sub_A010((int *)&v56, (std::string *)v57);
    sub_27EA0();
  }
LABEL_60:

LABEL_61:
  BOOL v30 = 0;
LABEL_62:

  return v30;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initVerticalOnly:", self->_isVerticalOnly);
  id v5 = v4;
  if (v4)
  {
    [v4 setLastReorderReason:self->_lastReorderReason];
    for (i = (id *)self->_nodes.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
    {
      id v7 = [i[3] copy];
      id v12 = v7;
      int64_t v8 = (void *)v5[17];
      id v9 = [v7 bundleIdentifier];
      [v8 setObject:v7 forKey:v9];

      id v11 = [v12 hex];
      sub_19F30((uint64_t)(v5 + 4), (int *)&v11, &v11, (uint64_t *)&v12);
    }
    *((unsigned char *)v5 + 8) = 0;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CSLHexAppGraph)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObject:objc_opt_class()];
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"Version"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v6 intValue];
    BOOL v8 = v7 < 2;
    if (v7 >= 2)
    {
      id v9 = cslprf_icon_field_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_28028(v7, v9);
      }

      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }
  if ([v4 containsValueForKey:@"verticalOnly"]) {
    id v10 = [v4 decodeBoolForKey:@"verticalOnly"];
  }
  else {
    id v10 = 0;
  }
  id v11 = [(CSLHexAppGraph *)self initVerticalOnly:v10];
  if (v11)
  {
    if (v8)
    {
      if ([v4 containsValueForKey:@"lastReason"]) {
        objc_msgSend(v11, "setLastReorderReason:", objc_msgSend(v4, "decodeIntegerForKey:", @"lastReason"));
      }
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
      id v14 = [v4 decodeObjectOfClasses:v13 forKey:@"Nodes"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_16304;
        v19[3] = &unk_3CC98;
        unint64_t v15 = (CSLHexAppGraph *)v11;
        unsigned int v20 = v15;
        id v6 = v14;
        [v6 enumerateObjectsUsingBlock:v19];

        [(CSLHexAppGraph *)v15 calculateNeighborCounts];
        if ([(CSLHexAppGraph *)v15 integrityCheck]) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v16 = cslprf_icon_field_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_27FC0();
        }

        id v6 = v14;
      }
    }
    unsigned int v17 = cslprf_icon_field_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [v11 abbreviatedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_27F5C();
    }

    unint64_t v15 = 0;
  }
  else
  {
    unint64_t v15 = 0;
  }
LABEL_24:

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeObject:&off_3DE80 forKey:@"Version"];
  if (self->_isVerticalOnly) {
    [v7 encodeBool:1 forKey:@"verticalOnly"];
  }
  unint64_t lastReorderReason = self->_lastReorderReason;
  if (lastReorderReason) {
    [v7 encodeInteger:lastReorderReason forKey:@"lastReason"];
  }
  id v5 = objc_alloc_init((Class)NSMutableSet);
  for (i = &self->_nodes.__table_.__p1_; ; [v5 addObject:i[3].__value_.__next_])
  {
    i = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<CSL::Hex, CSLHexAppNode *__unsafe_unretained>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<CSL::Hex, CSLHexAppNode *__unsafe_unretained>, void *>>> *)i->__value_.__next_;
    if (!i) {
      break;
    }
  }
  [v7 encodeObject:v5 forKey:@"Nodes"];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9 = [(CSLHexAppGraph *)self nodesByBundle];
  id v10 = (char *)[v9 countByEnumeratingWithState:a3 objects:a4 count:a5];

  var1 = a3->var1;
  a3->var1 = a4;
  if (v10)
  {
    uint64_t v12 = v10;
    do
    {
      uint64_t v13 = [(CSLHexAppGraph *)self nodesByBundle];
      id v14 = [v13 objectForKey:*var1];
      ++var1;
      *a4++ = v14;

      --v12;
    }
    while (v12);
  }
  return (unint64_t)v10;
}

- (id)allNodes
{
  return [(NSMutableDictionary *)self->_nodesByBundle allValues];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableDictionary *)self->_nodesByBundle count];
}

- (id)description
{
  int v3 = [(NSMutableDictionary *)self->_nodesByBundle allValues];
  id v4 = [v3 sortedArrayUsingComparator:&stru_3CCD8];
  id v5 = +[NSString stringWithFormat:@"graph<%p>: %@", self, v4];

  return v5;
}

- (NSString)abbreviatedDescription
{
  v2 = [(NSMutableDictionary *)self->_nodesByBundle allValues];
  int v3 = CSLHexNodesAbbreviatedDescription(v2);

  return (NSString *)v3;
}

+ (id)unarchiveFromDictionaryRepresentation:(id)a3
{
  int v3 = [a1 unarchiveFromPropertyList:a3];

  return v3;
}

- (id)archiveToPropertyList
{
  int v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithUnsignedInteger:self->_lastReorderReason];
  [v3 setValue:v4 forKey:@"lastReason"];

  if (self->_isVerticalOnly)
  {
    id v5 = +[NSNumber numberWithBool:1];
    [v3 setValue:v5 forKey:@"verticalOnly"];
  }
  id v6 = +[NSMutableArray arrayWithCapacity:self->_nodes.__table_.__p2_.__value_];
  for (i = (id *)self->_nodes.__table_.__p1_.__value_.__next_; i; i = (id *)*i)
  {
    id v8 = i[3];
    id v9 = [v8 archiveToDictionary];
    [v6 addObject:v9];
  }
  [v3 setObject:v6 forKey:@"nodes"];

  return v3;
}

- (id)initFromPropertyList:(id)a3
{
  id v4 = a3;
  id v5 = [(CSLHexAppGraph *)self initVerticalOnly:0];
  if (v5)
  {
    id v6 = v4;
    if ([v6 count])
    {
      uint64_t v43 = 0;
      v44[0] = &v43;
      v44[1] = 0x2020000000;
      v44[2] = 0;
      uint64_t v39 = 0;
      CFStringRef v40 = &v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x2020000000;
      char v38 = 0;
      uint64_t v31 = 0;
      id v32 = &v31;
      uint64_t v33 = 0x2020000000;
      char v34 = 1;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_16D44;
      v25[3] = &unk_3CD00;
      id v27 = &v31;
      uint64_t v28 = &v39;
      id v7 = v5;
      id v26 = v7;
      id v29 = &v35;
      BOOL v30 = &v43;
      [v6 enumerateKeysAndObjectsUsingBlock:v25];
      if (!*((unsigned char *)v32 + 24)) {
        goto LABEL_19;
      }
      id v8 = (uint64_t *)(v7 + 56);
      id v9 = (id)*((void *)v7 + 7);
      id v10 = [*((id *)v7 + 17) count];
      id v11 = v32;
      *((unsigned char *)v32 + 24) = v9 == v10;
      if (v9 != v10)
      {
        uint64_t v12 = cslprf_icon_field_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_28180((uint64_t)v51, *((void *)v7 + 7), (uint64_t)[*((id *)v7 + 17) count], v12);
        }

        id v11 = v32;
        if (!*((unsigned char *)v32 + 24)) {
          goto LABEL_19;
        }
      }
      if (*((unsigned char *)v36 + 24))
      {
        BOOL v13 = *v8 == *(void *)(v44[0] + 24);
        *((unsigned char *)v11 + 24) = v13;
        if (!v13)
        {
          id v14 = cslprf_icon_field_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_280F4((uint64_t *)v7 + 7, (uint64_t)v44, v14);
          }

          if (!*((unsigned char *)v32 + 24)) {
            goto LABEL_19;
          }
        }
      }
      if (!*((unsigned char *)v36 + 24))
      {
        uint64_t v15 = *v8;
        uint64_t v16 = *((unsigned __int8 *)v40 + 24);
        id v17 = [v6 count];
        *((unsigned char *)v32 + 24) = v15 + v16 == (void)v17;
        if ((id)(v15 + v16) != v17)
        {
          int v18 = cslprf_icon_field_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v22 = *v8;
            int v23 = *((unsigned __int8 *)v40 + 24);
            id v24 = [v6 count];
            *(_DWORD *)std::string buf = 134218496;
            uint64_t v46 = v22;
            __int16 v47 = 1024;
            int v48 = v23;
            __int16 v49 = 2048;
            id v50 = v24;
            _os_log_error_impl(&def_1A578, v18, OS_LOG_TYPE_ERROR, "invalid count (%ld + %d != %ld)", buf, 0x1Cu);
          }

          if (!*((unsigned char *)v32 + 24)) {
            goto LABEL_19;
          }
        }
      }
      [v7 calculateNeighborCounts];
      unsigned __int8 v19 = [v7 integrityCheck];
      *((unsigned char *)v32 + 24) = v19;
      if ((v19 & 1) == 0)
      {
LABEL_19:
        unsigned int v20 = cslprf_icon_field_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_280B0(v20);
        }

        id v7 = 0;
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(&v35, 8);
      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)unarchiveFromPropertyList:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [objc_alloc((Class)objc_opt_class()) initFromPropertyList:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)_emplaceNodeAtHex:(Hex)a3 withBundleIdentifier:(id)a4
{
  Hex v10 = a3;
  id v6 = a4;
  id v9 = [[CSLHexAppNode alloc] initWithBundleIdentifier:v6 hex:a3];
  [(NSMutableDictionary *)self->_nodesByBundle setObject:v9 forKey:v6];
  sub_19F30((uint64_t)&self->_nodes, (int *)&v10, &v10, (uint64_t *)&v9);
  id v7 = v9;

  return v7;
}

- (id)migrateToVerticalOnly
{
  id v3 = [[CSLHexAppGraph alloc] initVerticalOnly:1];
  sub_19160((uint64_t)v66, (uint64_t)&self->_nodes);
  v64 = 0;
  unint64_t v65 = 0xFFFFFFFE00000000;
  v62 = 0;
  v63 = 0;
  while (1)
  {
    unint64_t v4 = sub_10B68((unsigned int *)&v65);
    if ((int)v5 > 2) {
      break;
    }
    *((void *)&v7 + 1) = v5;
    *(void *)&long long v7 = v4;
    unint64_t v6 = v7 >> 32;
    std::string __p = (void *)v6;
    if (!v5 && !self->_isVerticalOnly && !HIDWORD(v4))
    {
      std::string __p = (void *)4294967294;
      if (!sub_19400(v66, (int *)&__p)) {
        std::string __p = &def_1A578 + 2;
      }
    }
    id v8 = sub_19400(v66, (int *)&__p);
    id v9 = v8;
    if (v8)
    {
      Hex v10 = [(id)v8[3] bundleIdentifier];
      id v11 = [(CSLHexAppGraph *)v3 _emplaceNodeAtHex:v6 withBundleIdentifier:v10];

      if (![v11 directPlacementReason]) {
        [v11 setDirectPlacementReason:3];
      }
      sub_194BC(v66, v9);
    }
    else
    {
      uint64_t v12 = v63;
      if (v63 >= v64)
      {
        uint64_t v14 = (v63 - (unsigned char *)v62) >> 3;
        if ((unint64_t)(v14 + 1) >> 61) {
          sub_196AC();
        }
        unint64_t v15 = (v64 - (unsigned char *)v62) >> 2;
        if (v15 <= v14 + 1) {
          unint64_t v15 = v14 + 1;
        }
        if ((unint64_t)(v64 - (unsigned char *)v62) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v16) {
          id v17 = (char *)sub_196C4((uint64_t)&v64, v16);
        }
        else {
          id v17 = 0;
        }
        int v18 = (unint64_t *)&v17[8 * v14];
        *int v18 = v6;
        BOOL v13 = (char *)(v18 + 1);
        unsigned int v20 = (char *)v62;
        unsigned __int8 v19 = v63;
        if (v63 != v62)
        {
          do
          {
            unint64_t v21 = *((void *)v19 - 1);
            v19 -= 8;
            *--int v18 = v21;
          }
          while (v19 != v20);
          unsigned __int8 v19 = (char *)v62;
        }
        v62 = v18;
        v63 = v13;
        v64 = &v17[8 * v16];
        if (v19) {
          operator delete(v19);
        }
      }
      else
      {
        *(void *)v63 = v6;
        BOOL v13 = v12 + 8;
      }
      v63 = v13;
    }
  }
  uint64_t v22 = (uint64_t)v67;
  if (self->_isVerticalOnly && v67 != 0)
  {
    do
    {
      while (1)
      {
        uint64_t v35 = *(void *)(v22 + 16);
        BOOL v36 = SHIDWORD(v35) < -2 || (HIDWORD(v35) + 2 * v35 + 3) > 6;
        if (!v36 && ![(CSLHexAppGraph *)v3 containsNodeAtHex:*(void *)(v22 + 16)]) {
          break;
        }
        uint64_t v22 = *(void *)v22;
        if (!v22) {
          goto LABEL_34;
        }
      }
      uint64_t v37 = [*(id *)(v22 + 24) bundleIdentifier];
      char v38 = [(CSLHexAppGraph *)v3 _emplaceNodeAtHex:v35 withBundleIdentifier:v37];

      if (![v38 directPlacementReason]) {
        [v38 setDirectPlacementReason:3];
      }
      uint64_t v22 = sub_194BC(v66, (uint64_t *)v22);
    }
    while (v22);
  }
LABEL_34:
  std::string __p = 0;
  v60 = 0;
  v61 = 0;
  sub_17DC8(&__p, v68);
  id v24 = v67;
  if (v67)
  {
    long long v25 = v60;
    do
    {
      uint64_t v26 = v24[2];
      if (v25 >= v61)
      {
        uint64_t v27 = (v25 - (unsigned char *)__p) >> 3;
        if ((unint64_t)(v27 + 1) >> 61) {
          sub_196AC();
        }
        unint64_t v28 = (v61 - (unsigned char *)__p) >> 2;
        if (v28 <= v27 + 1) {
          unint64_t v28 = v27 + 1;
        }
        if ((unint64_t)(v61 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v29 = v28;
        }
        if (v29) {
          BOOL v30 = (char *)sub_196C4((uint64_t)&v61, v29);
        }
        else {
          BOOL v30 = 0;
        }
        uint64_t v31 = &v30[8 * v27];
        *(void *)uint64_t v31 = v26;
        long long v25 = v31 + 8;
        uint64_t v33 = (char *)__p;
        id v32 = v60;
        if (v60 != __p)
        {
          do
          {
            uint64_t v34 = *((void *)v32 - 1);
            v32 -= 8;
            *((void *)v31 - 1) = v34;
            v31 -= 8;
          }
          while (v32 != v33);
          id v32 = (char *)__p;
        }
        std::string __p = v31;
        v60 = v25;
        v61 = &v30[8 * v29];
        if (v32) {
          operator delete(v32);
        }
      }
      else
      {
        *(void *)long long v25 = v26;
        v25 += 8;
      }
      v60 = v25;
      id v24 = (void *)*v24;
    }
    while (v24);
  }
  else
  {
    long long v25 = v60;
  }
  unint64_t v39 = 126 - 2 * __clz((v25 - (unsigned char *)__p) >> 3);
  if (v25 == __p) {
    uint64_t v40 = 0;
  }
  else {
    uint64_t v40 = v39;
  }
  sub_1A168((uint64_t)__p, (uint64_t *)v25, v40, 1);
  uint64_t v41 = (char *)__p;
  char v42 = v60;
  while (v41 != v42)
  {
    uint64_t v58 = *(void *)v41;
    uint64_t v43 = sub_19400(v66, (int *)&v58);
    if (v43)
    {
      unsigned int v45 = (char *)v62;
      long long v44 = v63;
      if (v62 == v63)
      {
        unint64_t v48 = sub_10B68((unsigned int *)&v65);
        uint64_t v47 = v49;
        unint64_t v46 = HIDWORD(v48);
        unsigned int v45 = (char *)v62;
        long long v44 = v63;
      }
      else
      {
        unint64_t v46 = *(unsigned int *)v62;
        uint64_t v47 = *((unsigned int *)v62 + 1);
      }
      if (v45 != v44)
      {
        int64_t v50 = v44 - (v45 + 8);
        if (v44 != v45 + 8) {
          memmove(v45, v45 + 8, v44 - (v45 + 8));
        }
        v63 = &v45[v50];
      }
      id v51 = [(id)v43[3] bundleIdentifier];
      id v52 = [(CSLHexAppGraph *)v3 _emplaceNodeAtHex:v46 | (v47 << 32) withBundleIdentifier:v51];

      if (![v52 directPlacementReason]) {
        [v52 setDirectPlacementReason:3];
      }
    }
    v41 += 8;
  }
  unint64_t v53 = [(CSLHexAppGraph *)self lastReorderReason];
  if (v53) {
    uint64_t v54 = v53;
  }
  else {
    uint64_t v54 = 3;
  }
  [(CSLHexAppGraph *)v3 setLastReorderReason:v54];
  if (![(CSLHexAppGraph *)v3 integrityCheckIgnoringNode:0 shouldCheckNeighbors:0]|| ([(CSLHexAppGraph *)v3 collapseAll343Holes], ![(CSLHexAppGraph *)v3 integrityCheckIgnoringNode:0 shouldCheckNeighbors:1]))
  {
    unint64_t v55 = self;

    id v3 = v55;
  }
  long long v56 = v3;
  if (__p)
  {
    v60 = (char *)__p;
    operator delete(__p);
  }
  if (v62)
  {
    v63 = (char *)v62;
    operator delete(v62);
  }
  sub_18C64((uint64_t)v66);

  return v56;
}

- (void)moveNodesToTopWithBundleIdentifiers:(id)a3 forReason:(unint64_t)a4
{
}

- (void)moveNodesWithBundleIdentifiers:(id)a3 toStartingHex:(Hex)a4 forReason:(unint64_t)a5
{
  Hex v30 = a4;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = a3;
  id v7 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v27;
    *(void *)&long long v8 = 138412546;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v12 = -[CSLHexAppGraph nodeWithBundleIdentifier:](self, "nodeWithBundleIdentifier:", v11, v22);
        if (v12)
        {
          LODWORD(v25) = (unint64_t)sub_10B68((unsigned int *)&v30) >> 32;
          HIDWORD(v25) = v13;
          uint64_t v14 = cslprf_icon_field_log();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            sub_A010((int *)&v25, &__p);
            int v15 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
            std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
            uint64_t v17 = NSStringFromCSLHexAppPlacementReason(a5);
            int v18 = (void *)v17;
            *(_DWORD *)std::string buf = 138543874;
            p_p = &__p;
            if (v15 < 0) {
              p_p = (std::string *)v16;
            }
            id v32 = v12;
            __int16 v33 = 2082;
            uint64_t v34 = p_p;
            __int16 v35 = 2114;
            uint64_t v36 = v17;
            _os_log_impl(&def_1A578, v14, OS_LOG_TYPE_DEFAULT, "moving node:%{public}@ to hex:%{public}s for reason:%{public}@", buf, 0x20u);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          [(CSLHexAppGraph *)self moveNode:v12 toHex:v25 final:1];
          [(CSLHexAppGraph *)self commitMovedNode:v12 withReason:a5];
        }
        else
        {
          unsigned int v20 = cslprf_icon_field_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromCSLHexAppPlacementReason(a5);
            unint64_t v21 = (std::string *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)std::string buf = v22;
            id v32 = v11;
            __int16 v33 = 2114;
            uint64_t v34 = v21;
            _os_log_impl(&def_1A578, v20, OS_LOG_TYPE_DEFAULT, "node not found : %@ cannot move to top for reason:%{public}@", buf, 0x16u);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v7);
  }
}

- (void)collapseAll343Holes
{
  if (!self->_isVerticalOnly)
  {
    unint64_t v21 = +[NSString stringWithFormat:@"%p does not make sense to collapseAll343Holes for non-vertical graphs %@", self, self];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
      int v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (std::string *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)std::string buf = 138544642;
      id v31 = v22;
      __int16 v32 = 2114;
      __int16 v33 = v24;
      __int16 v34 = 2048;
      __int16 v35 = self;
      __int16 v36 = 2114;
      CFStringRef v37 = @"CSLHexAppGraph.mm";
      __int16 v38 = 1024;
      int v39 = 2015;
      __int16 v40 = 2114;
      uint64_t v41 = v21;
      _os_log_error_impl(&def_1A578, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v21 UTF8String];
    uint64_t v25 = _bs_set_crash_log_message();
    sub_279F0(v25);
  }
  int value = self->_nodes.__table_.__p2_.__value_;
  unint64_t v28 = 0xFFFFFFFE00000000;
  unint64_t v29 = 0xFFFFFFFE00000000;
  if (value >= 1)
  {
    int v4 = 16 * value;
    do
    {
      uint64_t v5 = sub_10B68((unsigned int *)&v29);
      *((void *)&v7 + 1) = v6;
      *(void *)&long long v7 = v5;
      long long v8 = [(CSLHexAppGraph *)self nodeAtHex:(unint64_t)(v7 >> 32)];
      if (v8)
      {
        LODWORD(v27) = (unint64_t)sub_10B68((unsigned int *)&v28) >> 32;
        HIDWORD(v27) = v9;
        id v10 = [v8 hex];
        if (v27 != v10 || HIDWORD(v27) != HIDWORD(v10))
        {
          uint64_t v12 = cslprf_icon_field_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            sub_A010((int *)&v27, &__p);
            int v14 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
            std::string::size_type v15 = __p.__r_.__value_.__r.__words[0];
            uint64_t v16 = [(CSLHexAppGraph *)self nodeAtHex:v27];
            uint64_t v17 = (void *)v16;
            *(_DWORD *)std::string buf = 138412802;
            p_p = &__p;
            if (v14 < 0) {
              p_p = (std::string *)v15;
            }
            id v31 = v8;
            __int16 v32 = 2080;
            __int16 v33 = p_p;
            __int16 v34 = 2112;
            __int16 v35 = (CSLHexAppGraph *)v16;
            _os_log_debug_impl(&def_1A578, v12, OS_LOG_TYPE_DEBUG, "[343 collapse] move %@ -> %s; displaced:%@; ",
              buf,
              0x20u);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(__p.__r_.__value_.__l.__data_);
            }
          }
          [(CSLHexAppGraph *)self moveNode:v8 toHex:v27];
        }
        --value;
      }

      if (value < 1) {
        break;
      }
    }
    while (v4-- > 1);
    if (value >= 1)
    {
      unsigned __int8 v19 = cslprf_icon_field_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [(CSLHexAppGraph *)self description];
        objc_claimAutoreleasedReturnValue();
        sub_28584();
      }
    }
  }
}

- (CSLHexAppGraphDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSLHexAppGraphDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isVerticalOnly
{
  return self->_isVerticalOnly;
}

- (unint64_t)lastReorderReason
{
  return self->_lastReorderReason;
}

- (void)setLastReorderReason:(unint64_t)a3
{
  self->_unint64_t lastReorderReason = a3;
}

- (NSMutableDictionary)nodesByBundle
{
  return self->_nodesByBundle;
}

- (void)setNodesByBundle:(id)a3
{
}

- (NSMutableSet)changedNodes
{
  return self->_changedNodes;
}

- (void)setChangedNodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedNodes, 0);
  objc_storeStrong((id *)&self->_nodesByBundle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  sub_18C64((uint64_t)&self->_neighborCounts);

  sub_18C64((uint64_t)&self->_nodes);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_DWORD *)self + 16) = 1065353216;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end