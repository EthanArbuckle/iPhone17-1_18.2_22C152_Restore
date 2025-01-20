@interface MRUVendorSpecificRoute
- (BOOL)expanded;
- (BOOL)isAirPlayRoute;
- (BOOL)isDisplayedAsPicked;
- (BOOL)isGroup;
- (BOOL)isKnown;
- (BOOL)isPicked;
- (BOOL)isPreferredRoute;
- (BOOL)shouldBeDisplayed;
- (BOOL)supportsAirPlayGrouping;
- (BOOL)supportsGrouping;
- (DADevice)device;
- (MPAVRoute)underlyingNativeRoute;
- (MRUVendorSpecificRoute)initWithDevice:(id)a3;
- (MRUVendorSpecificRoute)preferredSubroute;
- (MRUVendorSpecificRoute)tempPreferredSubrouteOverride;
- (NSArray)endpoints;
- (NSArray)subroutes;
- (NSMutableDictionary)subrouteMap;
- (NSString)protocolIdentifier;
- (NSString)protocolName;
- (UIImage)protocolIcon;
- (id)routeName;
- (id)routeUID;
- (int64_t)moreCapableTypeBetween:(int64_t)a3 otherType:(int64_t)a4;
- (int64_t)routeSubtype;
- (int64_t)routeType;
- (int64_t)vendorSpecificRouteType;
- (void)addSubRoute:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setIsPicked:(BOOL)a3;
- (void)setIsPreferredRoute:(BOOL)a3;
- (void)setShouldBeDisplayed:(BOOL)a3;
- (void)setSubrouteMap:(id)a3;
- (void)setTempPreferredSubrouteOverride:(id)a3;
- (void)setUnderlyingNativeRoute:(id)a3;
@end

@implementation MRUVendorSpecificRoute

- (MRUVendorSpecificRoute)initWithDevice:(id)a3
{
  id v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MRUVendorSpecificRoute;
  v6 = [(MRUVendorSpecificRoute *)&v32 init];
  v7 = v6;
  if (v6)
  {
    v6->_shouldBeDisplayed = 1;
    if (v5)
    {
      objc_storeStrong((id *)&v6->_device, a3);
      if ([(MRUVendorSpecificRoute *)v7 isGroup])
      {
        v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        subrouteMap = v7->_subrouteMap;
        v7->_subrouteMap = v8;

        v7->_expanded = 0;
      }
      else
      {
        v14 = [v5 protocolType];
        v15 = v14;
        if (v14)
        {
          v16 = (void *)MEMORY[0x1E4F6F260];
          v17 = [v14 identifier];
          v18 = [v16 symbolForTypeIdentifier:v17 error:0];

          if (v18)
          {
            v19 = [MEMORY[0x1E4FB1BA8] mainScreen];
            [v19 scale];
            v21 = objc_msgSend(v18, "imageForSize:scale:", 20.0, 20.0, v20);

            v22 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v21, "CGImage"));
            v23 = [v22 imageWithRenderingMode:2];

            if (v23)
            {
              v24 = v23;
            }
            else
            {
              v24 = [MEMORY[0x1E4FB1818] systemImageNamed:@"airplayvideo"];
            }
            protocolIcon = v7->_protocolIcon;
            v7->_protocolIcon = v24;

            v28 = [v15 localizedDescription];

            if (v28)
            {
              uint64_t v29 = [v15 localizedDescription];
              protocolName = v7->_protocolName;
              v7->_protocolName = (NSString *)v29;
            }
            else
            {
              protocolName = v7->_protocolName;
              v7->_protocolName = (NSString *)@"Unknown Protocol";
            }
          }
        }
        else
        {
          uint64_t v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"airplayvideo"];
          v27 = v7->_protocolIcon;
          v7->_protocolIcon = (UIImage *)v26;

          v18 = v7->_protocolName;
          v7->_protocolName = (NSString *)@"Unknown Protocol";
        }
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"airplayvideo"];
      v11 = v7->_protocolIcon;
      v7->_protocolIcon = (UIImage *)v10;

      uint64_t v12 = +[MRUStringsProvider vendorSpecificAirPlay];
      v13 = v7->_protocolName;
      v7->_protocolName = (NSString *)v12;
    }
  }

  return v7;
}

- (id)routeName
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(MRUVendorSpecificRoute *)self isGroup])
  {
    v3 = [(DADevice *)self->_device endpoints];
    v4 = [v3 allValues];
    id v5 = [v4 firstObject];
    v6 = [v5 name];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = [(DADevice *)self->_device endpoints];
    v8 = [v7 allValues];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          v14 = [v13 underlyingDADevice];

          if (!v14)
          {
            uint64_t v15 = [v13 name];

            v6 = (void *)v15;
            goto LABEL_14;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    if ([(MRUVendorSpecificRoute *)self isAirPlayRoute]) {
      [(MPAVRoute *)self->_underlyingNativeRoute routeName];
    }
    else {
    v6 = [(DADevice *)self->_device name];
    }
  }

  return v6;
}

- (id)routeUID
{
  if (self->_underlyingNativeRoute) {
    [(MPAVRoute *)self->_underlyingNativeRoute routeUID];
  }
  else {
  v2 = [(DADevice *)self->_device identifier];
  }

  return v2;
}

- (int64_t)vendorSpecificRouteType
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(MRUVendorSpecificRoute *)self isGroup])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = [(MRUVendorSpecificRoute *)self subroutes];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      int64_t v6 = 0;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v3);
          }
          int64_t v6 = -[MRUVendorSpecificRoute moreCapableTypeBetween:otherType:](self, "moreCapableTypeBetween:otherType:", v6, [*(id *)(*((void *)&v11 + 1) + 8 * i) vendorSpecificRouteType]);
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      int64_t v6 = 0;
    }

    return v6;
  }
  if ([(MRUVendorSpecificRoute *)self isAirPlayRoute])
  {
    if ((unint64_t)([(MPAVRoute *)self->_underlyingNativeRoute routeType] - 1) >= 2) {
      return 0;
    }
    else {
      return 3;
    }
  }
  device = self->_device;

  return [(DADevice *)device type];
}

- (int64_t)routeType
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MRUVendorSpecificRoute *)self isGroup])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v3 = [(MRUVendorSpecificRoute *)self subroutes];
    int64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      char v5 = 0;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          v5 |= [*(id *)(*((void *)&v10 + 1) + 8 * i) routeType] == 1;
        }
        int64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
      int64_t v4 = v5 & 1;
    }

    return v4;
  }
  if (![(MRUVendorSpecificRoute *)self isAirPlayRoute]) {
    return ((unint64_t)[(DADevice *)self->_device flags] >> 2) & 1;
  }
  underlyingNativeRoute = self->_underlyingNativeRoute;

  return [(MPAVRoute *)underlyingNativeRoute routeType];
}

- (int64_t)routeSubtype
{
  return 0;
}

- (BOOL)isGroup
{
  v2 = [(DADevice *)self->_device endpoints];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSArray)subroutes
{
  v2 = [(NSMutableDictionary *)self->_subrouteMap allValues];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__MRUVendorSpecificRoute_subroutes__block_invoke;
  v5[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  v5[4] = 577;
  BOOL v3 = [v2 sortedArrayUsingComparator:v5];

  return (NSArray *)v3;
}

uint64_t __35__MRUVendorSpecificRoute_subroutes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 protocolName];
  v8 = [v6 protocolName];
  uint64_t v9 = [v7 compare:v8 options:*(void *)(a1 + 32)];

  if (!v9)
  {
    long long v10 = [v5 routeUID];
    long long v11 = [v6 routeUID];
    uint64_t v9 = [v10 compare:v11 options:*(void *)(a1 + 32)];
  }
  return v9;
}

- (NSArray)endpoints
{
  v2 = [(DADevice *)self->_device endpoints];
  BOOL v3 = [v2 allValues];
  int64_t v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_40];

  return (NSArray *)v4;
}

BOOL __35__MRUVendorSpecificRoute_endpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  return v5 < v6;
}

- (BOOL)isAirPlayRoute
{
  return self->_underlyingNativeRoute != 0;
}

- (BOOL)supportsAirPlayGrouping
{
  if ([(MRUVendorSpecificRoute *)self isGroup]
    || ![(MRUVendorSpecificRoute *)self isAirPlayRoute])
  {
    return 0;
  }
  underlyingNativeRoute = self->_underlyingNativeRoute;

  return [(MPAVRoute *)underlyingNativeRoute supportsAirPlayGrouping];
}

- (BOOL)supportsGrouping
{
  if ([(MRUVendorSpecificRoute *)self isGroup]) {
    return 0;
  }
  if ([(MRUVendorSpecificRoute *)self isAirPlayRoute])
  {
    underlyingNativeRoute = self->_underlyingNativeRoute;
    return [(MPAVRoute *)underlyingNativeRoute supportsAirPlayGrouping];
  }
  else
  {
    device = self->_device;
    return [(DADevice *)device supportsGrouping];
  }
}

- (BOOL)isDisplayedAsPicked
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(MRUVendorSpecificRoute *)self isGroup])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    BOOL v3 = [(MRUVendorSpecificRoute *)self subroutes];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * v7) isDisplayedAsPicked])
          {

            return 1;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return 0;
  }
  else if ([(MRUVendorSpecificRoute *)self isAirPlayRoute])
  {
    underlyingNativeRoute = self->_underlyingNativeRoute;
    return [(MPAVRoute *)underlyingNativeRoute isDisplayedAsPicked];
  }
  else
  {
    return self->_isPicked;
  }
}

- (BOOL)isKnown
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(MRUVendorSpecificRoute *)self isGroup])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v3 = [(MRUVendorSpecificRoute *)self subroutes];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        char v9 = [v8 isKnown];
        if ([v8 isAirPlayRoute]) {
          break;
        }
        if (v5 == ++v7)
        {
          uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v5) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    else
    {
      char v9 = 0;
    }

    return v9;
  }
  else
  {
    if ([(MRUVendorSpecificRoute *)self isAirPlayRoute]) {
      uint64_t v10 = 248;
    }
    else {
      uint64_t v10 = 216;
    }
    long long v11 = *(Class *)((char *)&self->super.super.isa + v10);
    return [v11 isKnown];
  }
}

- (NSString)protocolIdentifier
{
  v2 = [(DADevice *)self->_device protocolType];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_expanded = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_subrouteMap allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setShouldBeDisplayed:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addSubRoute:(id)a3
{
  subrouteMap = self->_subrouteMap;
  id v6 = a3;
  uint64_t v5 = [v6 routeUID];
  [(NSMutableDictionary *)subrouteMap setObject:v6 forKeyedSubscript:v5];

  [v6 setParentRoute:self];
  [v6 setShouldBeDisplayed:self->_expanded];
}

- (MRUVendorSpecificRoute)preferredSubroute
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  tempPreferredSubrouteOverride = self->_tempPreferredSubrouteOverride;
  if (tempPreferredSubrouteOverride)
  {
    BOOL v3 = tempPreferredSubrouteOverride;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->_subrouteMap allValues];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 isPreferredRoute])
          {
            BOOL v3 = v9;

            goto LABEL_13;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    BOOL v3 = 0;
  }
LABEL_13:

  return v3;
}

- (int64_t)moreCapableTypeBetween:(int64_t)a3 otherType:(int64_t)a4
{
  if (a3 <= a4) {
    return a4;
  }
  else {
    return a3;
  }
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)shouldBeDisplayed
{
  return self->_shouldBeDisplayed;
}

- (void)setShouldBeDisplayed:(BOOL)a3
{
  self->_shouldBeDisplayed = a3;
}

- (DADevice)device
{
  return self->_device;
}

- (UIImage)protocolIcon
{
  return self->_protocolIcon;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (MRUVendorSpecificRoute)tempPreferredSubrouteOverride
{
  return self->_tempPreferredSubrouteOverride;
}

- (void)setTempPreferredSubrouteOverride:(id)a3
{
}

- (BOOL)isPicked
{
  return self->_isPicked;
}

- (void)setIsPicked:(BOOL)a3
{
  self->_isPicked = a3;
}

- (MPAVRoute)underlyingNativeRoute
{
  return self->_underlyingNativeRoute;
}

- (void)setUnderlyingNativeRoute:(id)a3
{
}

- (BOOL)isPreferredRoute
{
  return self->_isPreferredRoute;
}

- (void)setIsPreferredRoute:(BOOL)a3
{
  self->_isPreferredRoute = a3;
}

- (NSMutableDictionary)subrouteMap
{
  return self->_subrouteMap;
}

- (void)setSubrouteMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrouteMap, 0);
  objc_storeStrong((id *)&self->_underlyingNativeRoute, 0);
  objc_storeStrong((id *)&self->_tempPreferredSubrouteOverride, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
  objc_storeStrong((id *)&self->_protocolIcon, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end