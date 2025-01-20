@interface _UIDiffableDataSourceUpdate
+ (id)updateDeleteAll;
- (BOOL)destinationIdentifierIsSectionIdentifier;
- (BOOL)isDeleteAll;
- (BOOL)isSectionOperation;
- (BOOL)shouldReconfigure;
- (NSOrderedSet)identifiers;
- (_UIDiffableDataSourceUpdate)initWithIdentifiers:(id)a3 sectionIdentifiers:(id)a4 action:(int64_t)a5 desinationIdentifier:(id)a6 relativePosition:(int64_t)a7 destinationIsSection:(BOOL)a8;
- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4;
- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6;
- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4;
- (_UIDiffableDataSourceUpdate)initWithReconfiguredItemIdentifiers:(id)a3;
- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4;
- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6;
- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4;
- (id)description;
- (id)destinationIdentifier;
- (int64_t)action;
- (int64_t)relativePosition;
- (void)_throwIfInvalid;
@end

@implementation _UIDiffableDataSourceUpdate

- (void).cxx_destruct
{
  objc_storeStrong(&self->_destinationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 114, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];
  }
  v8 = [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:0 sectionIdentifiers:v7 action:a4 desinationIdentifier:0 relativePosition:2 destinationIsSection:0];

  return v8;
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 124, @"Invalid parameter not satisfying: %@", @"itemIdentifiers" object file lineNumber description];
  }
  v9 = [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:v7 sectionIdentifiers:0 action:0 desinationIdentifier:v8 relativePosition:1 destinationIsSection:1];

  return v9;
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 appendingToDestinationSectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 129, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];
  }
  v9 = [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:0 sectionIdentifiers:v7 action:0 desinationIdentifier:v8 relativePosition:1 destinationIsSection:1];

  return v9;
}

- (_UIDiffableDataSourceUpdate)initWithIdentifiers:(id)a3 sectionIdentifiers:(id)a4 action:(int64_t)a5 desinationIdentifier:(id)a6 relativePosition:(int64_t)a7 destinationIsSection:(BOOL)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if (v15 && v16)
  {
    [MEMORY[0x263F08690] currentHandler];
    v38 = id v37 = v17;
    [v38 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 63, @"Invalid parameter not satisfying: %@", @"!(itemIdentifiers && sectionIdentifiers)" object file lineNumber description];

    id v17 = v37;
  }
  v50.receiver = self;
  v50.super_class = (Class)_UIDiffableDataSourceUpdate;
  v18 = [(_UIDiffableDataSourceUpdate *)&v50 init];
  if (v18)
  {
    SEL v45 = a2;
    if (v15) {
      v19 = v15;
    }
    else {
      v19 = v16;
    }
    id v20 = v19;
    uint64_t v21 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v20];
    identifiers = v18->_identifiers;
    v18->_identifiers = (NSOrderedSet *)v21;

    uint64_t v23 = [(NSOrderedSet *)v18->_identifiers count];
    if (v23 != [v20 count])
    {
      id v39 = v17;
      int64_t v40 = a5;
      id v41 = a6;
      id v42 = v16;
      int64_t v43 = a7;
      BOOL v44 = a8;
      id v24 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      id v25 = objc_alloc_init(MEMORY[0x263EFF9B0]);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v26 = v20;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v47;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v47 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            if ([v24 containsObject:v31]) {
              v32 = v25;
            }
            else {
              v32 = v24;
            }
            [v32 addObject:v31];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v46 objects:v51 count:16];
        }
        while (v28);
      }

      v33 = [MEMORY[0x263F08690] currentHandler];
      v34 = v33;
      v35 = @"section";
      if (v15) {
        v35 = @"item";
      }
      [v33 handleFailureInMethod:v45, v18, @"_UIDiffableDataSourceUpdate.m", 81, @"Fatal: supplied %@ identifiers are not unique. Duplicate identifiers: %@", v35, v25 object file lineNumber description];

      a8 = v44;
      id v16 = v42;
      a7 = v43;
      a5 = v40;
      a6 = v41;
      id v17 = v39;
    }
    v18->_action = a5;
    v18->_isSectionOperation = v16 != 0;
    objc_storeStrong(&v18->_destinationIdentifier, a6);
    v18->_relativePosition = a7;
    v18->_destinationIdentifierIsSectionIdentifier = a8;
    [(_UIDiffableDataSourceUpdate *)v18 _throwIfInvalid];
  }
  return v18;
}

- (void)_throwIfInvalid
{
  int64_t action = self->_action;
  if (action == 3)
  {
    BOOL isSectionOperation = self->_isSectionOperation;
    BOOL v7 = [(NSOrderedSet *)self->_identifiers containsObject:self->_destinationIdentifier];
    if (isSectionOperation)
    {
      if (!v7) {
        return;
      }
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 174, @"Invalid update: destination for section move is the same as the source [%@] for update: %@.", self->_destinationIdentifier, self object file lineNumber description];
    }
    else
    {
      if (!v7) {
        return;
      }
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 176, @"Invalid update: destination for item move is the same as the source [%@] for update: %@.", self->_destinationIdentifier, self object file lineNumber description];
    }
  }
  else
  {
    if (action) {
      return;
    }
    id destinationIdentifier = self->_destinationIdentifier;
    if (self->_isSectionOperation)
    {
      if (!destinationIdentifier || !-[NSOrderedSet containsObject:](self->_identifiers, "containsObject:")) {
        return;
      }
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 165, @"Invalid update: destination for section operation [%@] is in the inserted section list for update: %@", self->_destinationIdentifier, self object file lineNumber description];
    }
    else
    {
      if (!destinationIdentifier
        || self->_destinationIdentifierIsSectionIdentifier
        || !-[NSOrderedSet containsObject:](self->_identifiers, "containsObject:"))
      {
        return;
      }
      id v8 = [MEMORY[0x263F08690] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 169, @"Invalid update: destination for insertion operation [%@] is in the insertion identifier list for update: %@.", self->_destinationIdentifier, self object file lineNumber description];
    }
  }
}

- (_UIDiffableDataSourceUpdate)initWithReconfiguredItemIdentifiers:(id)a3
{
  v3 = [(_UIDiffableDataSourceUpdate *)self initWithItemIdentifiers:a3 action:2];
  v4 = v3;
  if (v3) {
    v3->_shouldReconfigure = 1;
  }

  return v4;
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4
{
  return [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:a3 sectionIdentifiers:0 action:a4 desinationIdentifier:0 relativePosition:2 destinationIsSection:0];
}

- (BOOL)isSectionOperation
{
  return self->_isSectionOperation;
}

- (BOOL)shouldReconfigure
{
  return self->_shouldReconfigure;
}

- (NSOrderedSet)identifiers
{
  return self->_identifiers;
}

- (int64_t)action
{
  return self->_action;
}

- (id)destinationIdentifier
{
  return self->_destinationIdentifier;
}

- (int64_t)relativePosition
{
  return self->_relativePosition;
}

- (BOOL)destinationIdentifierIsSectionIdentifier
{
  return self->_destinationIdentifierIsSectionIdentifier;
}

- (BOOL)isDeleteAll
{
  return self->_isDeleteAll;
}

- (_UIDiffableDataSourceUpdate)initWithItemIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6
{
  return [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:a3 sectionIdentifiers:0 action:a4 desinationIdentifier:a5 relativePosition:a6 destinationIsSection:0];
}

- (_UIDiffableDataSourceUpdate)initWithSectionIdentifiers:(id)a3 action:(int64_t)a4 destinationIdentifier:(id)a5 relativePosition:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceUpdate.m", 119, @"Invalid parameter not satisfying: %@", @"sectionIdentifiers" object file lineNumber description];
  }
  v13 = [(_UIDiffableDataSourceUpdate *)self initWithIdentifiers:0 sectionIdentifiers:v11 action:a4 desinationIdentifier:v12 relativePosition:a6 destinationIsSection:0];

  return v13;
}

+ (id)updateDeleteAll
{
  v2 = (unsigned char *)[objc_alloc((Class)a1) initWithIdentifiers:0 sectionIdentifiers:0 action:1 desinationIdentifier:0 relativePosition:2 destinationIsSection:1];
  v2[11] = 1;
  return v2;
}

- (id)description
{
  switch(self->_action)
  {
    case 0:
      v3 = @"INS";
      break;
    case 1:
      v3 = @"DEL";
      break;
    case 2:
      if (self->_shouldReconfigure) {
        v4 = @"REC";
      }
      else {
        v4 = @"REL";
      }
      v3 = v4;
      break;
    case 3:
      v3 = @"MOV";
      break;
    case 4:
      v3 = @"NOOP";
      break;
    default:
      v3 = @"<unknown>";
      break;
  }
  v5 = [(NSOrderedSet *)self->_identifiers array];
  v6 = [v5 componentsJoinedByString:@","];

  BOOL v7 = NSString;
  id v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id destinationIdentifier = self->_destinationIdentifier;
  id v11 = [NSNumber numberWithBool:self->_destinationIdentifierIsSectionIdentifier];
  objc_msgSend(v7, "stringWithFormat:", @"<%@ %p - action: %@; destinationIdentifier:%@; destIsSection: %@; identifiers: [%@]>",
    v9,
    self,
    v3,
    destinationIdentifier,
    v11,
  id v12 = v6);

  return v12;
}

@end