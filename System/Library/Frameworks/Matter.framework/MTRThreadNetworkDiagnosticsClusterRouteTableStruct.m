@interface MTRThreadNetworkDiagnosticsClusterRouteTableStruct
- (MTRThreadNetworkDiagnosticsClusterRouteTableStruct)init;
- (NSNumber)age;
- (NSNumber)allocated;
- (NSNumber)extAddress;
- (NSNumber)linkEstablished;
- (NSNumber)lqiIn;
- (NSNumber)lqiOut;
- (NSNumber)nextHop;
- (NSNumber)pathCost;
- (NSNumber)rloc16;
- (NSNumber)routerId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAge:(NSNumber *)age;
- (void)setAllocated:(NSNumber *)allocated;
- (void)setExtAddress:(NSNumber *)extAddress;
- (void)setLinkEstablished:(NSNumber *)linkEstablished;
- (void)setLqiIn:(NSNumber *)lqiIn;
- (void)setLqiOut:(NSNumber *)lqiOut;
- (void)setNextHop:(NSNumber *)nextHop;
- (void)setPathCost:(NSNumber *)pathCost;
- (void)setRloc16:(NSNumber *)rloc16;
- (void)setRouterId:(NSNumber *)routerId;
@end

@implementation MTRThreadNetworkDiagnosticsClusterRouteTableStruct

- (MTRThreadNetworkDiagnosticsClusterRouteTableStruct)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRThreadNetworkDiagnosticsClusterRouteTableStruct;
  v2 = [(MTRThreadNetworkDiagnosticsClusterRouteTableStruct *)&v15 init];
  v3 = v2;
  if (v2)
  {
    extAddress = v2->_extAddress;
    v2->_extAddress = (NSNumber *)&unk_26F9C8620;

    rloc16 = v3->_rloc16;
    v3->_rloc16 = (NSNumber *)&unk_26F9C8620;

    routerId = v3->_routerId;
    v3->_routerId = (NSNumber *)&unk_26F9C8620;

    nextHop = v3->_nextHop;
    v3->_nextHop = (NSNumber *)&unk_26F9C8620;

    pathCost = v3->_pathCost;
    v3->_pathCost = (NSNumber *)&unk_26F9C8620;

    lqiIn = v3->_lqiIn;
    v3->_lqiIn = (NSNumber *)&unk_26F9C8620;

    lqiOut = v3->_lqiOut;
    v3->_lqiOut = (NSNumber *)&unk_26F9C8620;

    age = v3->_age;
    v3->_age = (NSNumber *)&unk_26F9C8620;

    allocated = v3->_allocated;
    v3->_allocated = (NSNumber *)&unk_26F9C8620;

    linkEstablished = v3->_linkEstablished;
    v3->_linkEstablished = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterRouteTableStruct);
  v7 = objc_msgSend_extAddress(self, v5, v6);
  objc_msgSend_setExtAddress_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_rloc16(self, v9, v10);
  objc_msgSend_setRloc16_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_routerId(self, v13, v14);
  objc_msgSend_setRouterId_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_nextHop(self, v17, v18);
  objc_msgSend_setNextHop_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_pathCost(self, v21, v22);
  objc_msgSend_setPathCost_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_lqiIn(self, v25, v26);
  objc_msgSend_setLqiIn_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_lqiOut(self, v29, v30);
  objc_msgSend_setLqiOut_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_age(self, v33, v34);
  objc_msgSend_setAge_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_allocated(self, v37, v38);
  objc_msgSend_setAllocated_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_linkEstablished(self, v41, v42);
  objc_msgSend_setLinkEstablished_(v4, v44, (uint64_t)v43);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: extAddress:%@; rloc16:%@; routerId:%@; nextHop:%@; pathCost:%@; lqiIn:%@; lqiOut:%@; age:%@; allocated:%@; linkEstablished:%@; >",
    v5,
    self->_extAddress,
    self->_rloc16,
    self->_routerId,
    self->_nextHop,
    self->_pathCost,
    self->_lqiIn,
    self->_lqiOut,
    self->_age,
    self->_allocated,
  v7 = self->_linkEstablished);

  return v7;
}

- (NSNumber)extAddress
{
  return self->_extAddress;
}

- (void)setExtAddress:(NSNumber *)extAddress
{
}

- (NSNumber)rloc16
{
  return self->_rloc16;
}

- (void)setRloc16:(NSNumber *)rloc16
{
}

- (NSNumber)routerId
{
  return self->_routerId;
}

- (void)setRouterId:(NSNumber *)routerId
{
}

- (NSNumber)nextHop
{
  return self->_nextHop;
}

- (void)setNextHop:(NSNumber *)nextHop
{
}

- (NSNumber)pathCost
{
  return self->_pathCost;
}

- (void)setPathCost:(NSNumber *)pathCost
{
}

- (NSNumber)lqiIn
{
  return self->_lqiIn;
}

- (void)setLqiIn:(NSNumber *)lqiIn
{
}

- (NSNumber)lqiOut
{
  return self->_lqiOut;
}

- (void)setLqiOut:(NSNumber *)lqiOut
{
}

- (NSNumber)age
{
  return self->_age;
}

- (void)setAge:(NSNumber *)age
{
}

- (NSNumber)allocated
{
  return self->_allocated;
}

- (void)setAllocated:(NSNumber *)allocated
{
}

- (NSNumber)linkEstablished
{
  return self->_linkEstablished;
}

- (void)setLinkEstablished:(NSNumber *)linkEstablished
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEstablished, 0);
  objc_storeStrong((id *)&self->_allocated, 0);
  objc_storeStrong((id *)&self->_age, 0);
  objc_storeStrong((id *)&self->_lqiOut, 0);
  objc_storeStrong((id *)&self->_lqiIn, 0);
  objc_storeStrong((id *)&self->_pathCost, 0);
  objc_storeStrong((id *)&self->_nextHop, 0);
  objc_storeStrong((id *)&self->_routerId, 0);
  objc_storeStrong((id *)&self->_rloc16, 0);

  objc_storeStrong((id *)&self->_extAddress, 0);
}

@end