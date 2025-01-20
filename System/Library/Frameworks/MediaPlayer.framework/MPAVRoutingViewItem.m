@interface MPAVRoutingViewItem
+ (id)itemWithActionTitle:(id)a3 subtitle:(id)a4 enabled:(BOOL)a5 identifier:(id)a6 image:(id)a7;
+ (id)itemWithLeader:(id)a3 members:(id)a4;
+ (id)itemWithRoute:(id)a3;
+ (id)itemWithVendorSpecificCustomRowTitle:(id)a3 icon:(id)a4 identifier:(id)a5;
+ (id)itemWithVendorSpecificLeader:(id)a3 members:(id)a4;
+ (id)itemWithVendorSpecificRoute:(id)a3;
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpandable;
- (BOOL)isExpanded;
- (BOOL)isPickable;
- (MPAVRoute)leader;
- (MPAVRoute)mainRoute;
- (NSArray)routes;
- (NSString)actionIdentifier;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)vendorSpecificCustomRowIdentifier;
- (UIImage)image;
- (id)_stateDumpObject;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)nestedLevel;
- (void)setExpanded:(BOOL)a3;
@end

@implementation MPAVRoutingViewItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorSpecificCustomRowIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_leader, 0);
  objc_storeStrong((id *)&self->_routes, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSString)vendorSpecificCustomRowIdentifier
{
  return self->_vendorSpecificCustomRowIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (MPAVRoute)leader
{
  return self->_leader;
}

- (NSArray)routes
{
  return self->_routes;
}

- (int64_t)type
{
  return self->_type;
}

- (id)_stateDumpObject
{
  switch(self->_type)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      v3 = [(NSArray *)self->_routes firstObject];
      uint64_t v4 = [v3 debugDescription];
      v5 = (void *)v4;
      v6 = @"<NONE>";
      if (v4) {
        v6 = (__CFString *)v4;
      }
      v2 = v6;

      goto LABEL_8;
    case 1:
    case 7:
      uint64_t v7 = [(NSArray *)self->_routes debugDescription];
      v3 = (void *)v7;
      v8 = @"<NONE>";
      if (v7) {
        v8 = (__CFString *)v7;
      }
      v2 = v8;
LABEL_8:

      break;
    case 2:
      actionIdentifier = (__CFString *)self->_actionIdentifier;
      goto LABEL_11;
    case 6:
      actionIdentifier = (__CFString *)self->_vendorSpecificCustomRowIdentifier;
LABEL_11:
      if (!actionIdentifier) {
        actionIdentifier = @"<NONE>";
      }
      v2 = actionIdentifier;
      break;
    default:
      break;
  }

  return v2;
}

- (unint64_t)hash
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_routes;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "routeUID", (void)v11);
        v6 ^= [v9 hash];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return [(NSString *)self->_actionIdentifier hash] ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPAVRoutingViewItem *)a3;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(MPAVRoutingViewItem *)v5 type];
      if (v6 != [(MPAVRoutingViewItem *)self type])
      {
        LOBYTE(self) = 0;
        goto LABEL_11;
      }
      unint64_t v7 = [(MPAVRoutingViewItem *)self type];
      if (v7 > 7) {
        goto LABEL_11;
      }
      if (((1 << v7) & 0xBB) != 0)
      {
        self = (MPAVRoutingViewItem *)self->_routes;
        v8 = [(MPAVRoutingViewItem *)v5 routes];
        LOBYTE(self) = [(MPAVRoutingViewItem *)self isEqual:v8];
LABEL_7:

LABEL_11:
        goto LABEL_12;
      }
      if (v7 == 2)
      {
        actionIdentifier = self->_actionIdentifier;
        v8 = [(MPAVRoutingViewItem *)v5 actionIdentifier];
        if ([(NSString *)actionIdentifier isEqualToString:v8])
        {
          localizedSubtitle = self->_localizedSubtitle;
          long long v12 = [(MPAVRoutingViewItem *)v5 localizedSubtitle];
          if (localizedSubtitle == v12)
          {
          }
          else
          {
            int v13 = [(NSString *)localizedSubtitle isEqual:v12];

            if (!v13)
            {
              LOBYTE(self) = 0;
LABEL_24:

              goto LABEL_7;
            }
          }
          LODWORD(self) = self->_enabled;
          LOBYTE(self) = self == [(MPAVRoutingViewItem *)v5 enabled];
          goto LABEL_24;
        }
      }
      else
      {
        vendorSpecificCustomRowIdentifier = self->_vendorSpecificCustomRowIdentifier;
        v8 = [(MPAVRoutingViewItem *)v5 vendorSpecificCustomRowIdentifier];
        if ([(NSString *)vendorSpecificCustomRowIdentifier isEqualToString:v8])
        {
          self = (MPAVRoutingViewItem *)self->_localizedTitle;
          long long v12 = [(MPAVRoutingViewItem *)v5 localizedTitle];
          LOBYTE(self) = [(MPAVRoutingViewItem *)self isEqualToString:v12];
          goto LABEL_24;
        }
      }
      LOBYTE(self) = 0;
      goto LABEL_7;
    }
    LOBYTE(self) = 0;
  }
LABEL_12:

  return self & 1;
}

- (unint64_t)nestedLevel
{
  v2 = [(MPAVRoutingViewItem *)self mainRoute];
  v3 = [v2 parentRoute];

  if (v3)
  {
    v3 = 0;
    uint64_t v4 = v2;
    do
    {
      ++v3;
      v2 = [v4 parentRoute];

      uint64_t v5 = [v2 parentRoute];

      uint64_t v4 = v2;
    }
    while (v5);
  }

  return (unint64_t)v3;
}

- (BOOL)isPickable
{
  v2 = [(MPAVRoutingViewItem *)self mainRoute];
  char v3 = [v2 isPickable];

  return v3;
}

- (BOOL)isExpandable
{
  char v3 = [(MPAVRoutingViewItem *)self mainRoute];
  uint64_t v4 = [v3 subRoutes];
  if ([v4 count]) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = self->_type == 1;
  }

  return v5;
}

- (MPAVRoute)mainRoute
{
  leader = self->_leader;
  if (leader)
  {
    char v3 = leader;
  }
  else
  {
    char v3 = [(NSArray *)self->_routes firstObject];
  }

  return v3;
}

- (NSString)localizedTitle
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  switch([(MPAVRoutingViewItem *)self type])
  {
    case 0:
    case 3:
    case 4:
      char v3 = [(MPAVRoutingViewItem *)self routes];
      uint64_t v4 = [v3 firstObject];
      uint64_t v5 = [v4 routeName];
      goto LABEL_16;
    case 1:
    case 7:
      uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
      unint64_t v7 = [(MPAVRoutingViewItem *)self routes];
      char v3 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v8 = [(MPAVRoutingViewItem *)self routes];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            int v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            long long v14 = [v13 routeName];

            if (v14)
            {
              v15 = [v13 routeName];
              [v3 addObject:v15];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v10);
      }

      uint64_t v16 = [v3 componentsJoinedByString:@" + "];
      goto LABEL_17;
    case 2:
    case 6:
      uint64_t v16 = self->_localizedTitle;
      break;
    case 5:
      char v3 = [(MPAVRoutingViewItem *)self routes];
      uint64_t v4 = [v3 firstObject];
      uint64_t v5 = [v4 protocolName];
LABEL_16:
      uint64_t v16 = (__CFString *)v5;

LABEL_17:
      break;
    default:
      uint64_t v16 = &stru_1EE680640;
      break;
  }

  return (NSString *)v16;
}

+ (id)itemWithVendorSpecificCustomRowTitle:(id)a3 icon:(id)a4 identifier:(id)a5
{
  unint64_t v7 = (UIImage *)a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_alloc_init(MPAVRoutingViewItem);
  uint64_t v11 = [v9 copy];

  localizedTitle = v10->_localizedTitle;
  v10->_localizedTitle = (NSString *)v11;

  image = v10->_image;
  v10->_image = v7;
  long long v14 = v7;

  uint64_t v15 = [v8 copy];
  vendorSpecificCustomRowIdentifier = v10->_vendorSpecificCustomRowIdentifier;
  v10->_vendorSpecificCustomRowIdentifier = (NSString *)v15;

  v10->_enabled = 1;
  v10->_type = 6;

  return v10;
}

+ (id)itemWithVendorSpecificLeader:(id)a3 members:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (MPAVRoute *)a3;
  id v6 = a4;
  unint64_t v7 = objc_alloc_init(MPAVRoutingViewItem);
  id v8 = (NSArray *)[v6 copy];

  if (![(NSArray *)v8 containsObject:v5])
  {
    v20[0] = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v10 = [v9 arrayByAddingObjectsFromArray:v8];

    id v8 = (NSArray *)v10;
  }
  routes = v7->_routes;
  v7->_routes = v8;
  long long v12 = v8;

  int v13 = NSString;
  long long v14 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"ROUTING_GROUP_SUBTITLE_COUNT" value:&stru_1EE680640 table:@"MediaPlayer"];
  uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v15, -[NSArray count](v12, "count"));
  localizedSubtitle = v7->_localizedSubtitle;
  v7->_localizedSubtitle = (NSString *)v16;

  leader = v7->_leader;
  v7->_leader = v5;

  v7->_enabled = 1;
  v7->_type = 7;

  return v7;
}

+ (id)itemWithVendorSpecificRoute:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MPAVRoutingViewItem);
  v9[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  routes = v4->_routes;
  v4->_routes = (NSArray *)v5;

  v4->_enabled = 1;
  if ([v3 isGroup])
  {
    uint64_t v7 = 4;
  }
  else if ([v3 isSubRoute])
  {
    uint64_t v7 = 5;
  }
  else
  {
    uint64_t v7 = 3;
  }
  v4->_type = v7;

  return v4;
}

+ (id)itemWithActionTitle:(id)a3 subtitle:(id)a4 enabled:(BOOL)a5 identifier:(id)a6 image:(id)a7
{
  uint64_t v11 = (UIImage *)a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = objc_alloc_init(MPAVRoutingViewItem);
  uint64_t v16 = [v14 copy];

  localizedTitle = v15->_localizedTitle;
  v15->_localizedTitle = (NSString *)v16;

  uint64_t v18 = [v13 copy];
  localizedSubtitle = v15->_localizedSubtitle;
  v15->_localizedSubtitle = (NSString *)v18;

  v15->_enabled = a5;
  uint64_t v20 = [v12 copy];

  actionIdentifier = v15->_actionIdentifier;
  v15->_actionIdentifier = (NSString *)v20;

  image = v15->_image;
  v15->_image = v11;

  v15->_type = 2;

  return v15;
}

+ (id)itemWithLeader:(id)a3 members:(id)a4
{
  uint64_t v5 = (MPAVRoute *)a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(MPAVRoutingViewItem);
  id v8 = (NSArray *)[v6 copy];

  if (![(NSArray *)v8 containsObject:v5])
  {
    uint64_t v9 = [(NSArray *)v8 arrayByAddingObject:v5];

    id v8 = (NSArray *)v9;
  }
  routes = v7->_routes;
  v7->_routes = v8;
  uint64_t v11 = v8;

  id v12 = NSString;
  id v13 = [MEMORY[0x1E4F28B50] mediaPlayerBundle];
  id v14 = [v13 localizedStringForKey:@"ROUTING_GROUP_SUBTITLE_COUNT" value:&stru_1EE680640 table:@"MediaPlayer"];
  uint64_t v15 = objc_msgSend(v12, "stringWithFormat:", v14, -[NSArray count](v11, "count"));
  localizedSubtitle = v7->_localizedSubtitle;
  v7->_localizedSubtitle = (NSString *)v15;

  leader = v7->_leader;
  v7->_leader = v5;

  v7->_enabled = 1;
  v7->_type = 1;

  return v7;
}

+ (id)itemWithRoute:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_alloc_init(MPAVRoutingViewItem);
  v8[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  routes = v4->_routes;
  v4->_routes = (NSArray *)v5;

  v4->_enabled = 1;
  v4->_type = 0;

  return v4;
}

@end