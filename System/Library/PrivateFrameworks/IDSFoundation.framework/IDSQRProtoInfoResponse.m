@interface IDSQRProtoInfoResponse
- (BOOL)hasClientAddress;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)clientAddress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)activeLightweightParticipants;
- (unint64_t)activeLightweightParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)activeLightweightParticipantsCount;
- (unint64_t)activeParticipants;
- (unint64_t)activeParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)activeParticipantsCount;
- (unint64_t)activeVirtualParticipants;
- (unint64_t)activeVirtualParticipantsAtIndex:(unint64_t)a3;
- (unint64_t)activeVirtualParticipantsCount;
- (unint64_t)hash;
- (void)addActiveLightweightParticipants:(unint64_t)a3;
- (void)addActiveParticipants:(unint64_t)a3;
- (void)addActiveVirtualParticipants:(unint64_t)a3;
- (void)clearActiveLightweightParticipants;
- (void)clearActiveParticipants;
- (void)clearActiveVirtualParticipants;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActiveLightweightParticipants:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setActiveParticipants:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setActiveVirtualParticipants:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setClientAddress:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoInfoResponse

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoInfoResponse;
  [(IDSQRProtoInfoResponse *)&v3 dealloc];
}

- (BOOL)hasClientAddress
{
  return self->_clientAddress != 0;
}

- (unint64_t)activeParticipantsCount
{
  return self->_activeParticipants.count;
}

- (unint64_t)activeParticipants
{
  return self->_activeParticipants.list;
}

- (void)clearActiveParticipants
{
}

- (void)addActiveParticipants:(unint64_t)a3
{
}

- (unint64_t)activeParticipantsAtIndex:(unint64_t)a3
{
  p_activeParticipants = &self->_activeParticipants;
  unint64_t count = self->_activeParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_activeParticipants->list[a3];
}

- (void)setActiveParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)activeLightweightParticipantsCount
{
  return self->_activeLightweightParticipants.count;
}

- (unint64_t)activeLightweightParticipants
{
  return self->_activeLightweightParticipants.list;
}

- (void)clearActiveLightweightParticipants
{
}

- (void)addActiveLightweightParticipants:(unint64_t)a3
{
}

- (unint64_t)activeLightweightParticipantsAtIndex:(unint64_t)a3
{
  p_activeLightweightParticipants = &self->_activeLightweightParticipants;
  unint64_t count = self->_activeLightweightParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_activeLightweightParticipants->list[a3];
}

- (void)setActiveLightweightParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)activeVirtualParticipantsCount
{
  return self->_activeVirtualParticipants.count;
}

- (unint64_t)activeVirtualParticipants
{
  return self->_activeVirtualParticipants.list;
}

- (void)clearActiveVirtualParticipants
{
}

- (void)addActiveVirtualParticipants:(unint64_t)a3
{
}

- (unint64_t)activeVirtualParticipantsAtIndex:(unint64_t)a3
{
  p_activeVirtualParticipants = &self->_activeVirtualParticipants;
  unint64_t count = self->_activeVirtualParticipants.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_activeVirtualParticipants->list[a3];
}

- (void)setActiveVirtualParticipants:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  double v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoInfoResponse;
  v4 = [(IDSQRProtoInfoResponse *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v8 = v5;
  clientAddress = self->_clientAddress;
  if (clientAddress) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)clientAddress, v7, @"client_address");
  }
  double v10 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, @"active_participants");

  objc_super v13 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, v15, @"active_lightweight_participants");

  v16 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, @"active_virtual_participants");

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoInfoResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_clientAddress)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_activeParticipants.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v9;
      ++v5;
    }
    while (v5 < self->_activeParticipants.count);
  }
  if (self->_activeLightweightParticipants.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v9;
      ++v6;
    }
    while (v6 < self->_activeLightweightParticipants.count);
  }
  p_activeVirtualParticipants = &self->_activeVirtualParticipants;
  if (p_activeVirtualParticipants->count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v9;
      ++v8;
    }
    while (v8 < p_activeVirtualParticipants->count);
  }
}

- (void)copyTo:(id)a3
{
  id v45 = a3;
  clientAddress = self->_clientAddress;
  if (clientAddress) {
    objc_msgSend_setClientAddress_(v45, v4, (uint64_t)clientAddress, v5);
  }
  if (objc_msgSend_activeParticipantsCount(self, v4, (uint64_t)clientAddress, v5))
  {
    objc_msgSend_clearActiveParticipants(v45, v7, v8, v9);
    uint64_t active = objc_msgSend_activeParticipantsCount(self, v10, v11, v12);
    if (active)
    {
      uint64_t v14 = active;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_activeParticipantsAtIndex_(self, v7, i, v9);
        objc_msgSend_addActiveParticipants_(v45, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_activeLightweightParticipantsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearActiveLightweightParticipants(v45, v19, v20, v21);
    uint64_t v25 = objc_msgSend_activeLightweightParticipantsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v28 = objc_msgSend_activeLightweightParticipantsAtIndex_(self, v19, j, v21);
        objc_msgSend_addActiveLightweightParticipants_(v45, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_activeVirtualParticipantsCount(self, v19, v20, v21))
  {
    objc_msgSend_clearActiveVirtualParticipants(v45, v31, v32, v33);
    uint64_t v37 = objc_msgSend_activeVirtualParticipantsCount(self, v34, v35, v36);
    if (v37)
    {
      uint64_t v40 = v37;
      for (uint64_t k = 0; k != v40; ++k)
      {
        uint64_t v42 = objc_msgSend_activeVirtualParticipantsAtIndex_(self, v38, k, v39);
        objc_msgSend_addActiveVirtualParticipants_(v45, v43, v42, v44);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  double v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_clientAddress, v13, (uint64_t)a3, v14);
  uint64_t v16 = (void *)v12[10];
  v12[10] = v15;

  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((clientAddress = self->_clientAddress, uint64_t v11 = v4[10], !((unint64_t)clientAddress | v11))
     || objc_msgSend_isEqual_(clientAddress, v8, v11, v9))
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual())
  {
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_clientAddress, a2, v2, v3);
  uint64_t v5 = PBRepeatedUInt64Hash();
  uint64_t v6 = v5 ^ PBRepeatedUInt64Hash();
  return v6 ^ PBRepeatedUInt64Hash() ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v7 = v4[10];
  v34 = v4;
  if (v7)
  {
    objc_msgSend_setClientAddress_(self, v5, v7, v6);
    uint64_t v4 = v34;
  }
  uint64_t active = objc_msgSend_activeParticipantsCount(v4, v5, v7, v6);
  if (active)
  {
    uint64_t v12 = active;
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v14 = objc_msgSend_activeParticipantsAtIndex_(v34, v9, i, v11);
      objc_msgSend_addActiveParticipants_(self, v15, v14, v16);
    }
  }
  uint64_t v17 = objc_msgSend_activeLightweightParticipantsCount(v34, v9, v10, v11);
  if (v17)
  {
    uint64_t v21 = v17;
    for (uint64_t j = 0; j != v21; ++j)
    {
      uint64_t v23 = objc_msgSend_activeLightweightParticipantsAtIndex_(v34, v18, j, v20);
      objc_msgSend_addActiveLightweightParticipants_(self, v24, v23, v25);
    }
  }
  uint64_t v26 = objc_msgSend_activeVirtualParticipantsCount(v34, v18, v19, v20);
  if (v26)
  {
    uint64_t v29 = v26;
    for (uint64_t k = 0; k != v29; ++k)
    {
      uint64_t v31 = objc_msgSend_activeVirtualParticipantsAtIndex_(v34, v27, k, v28);
      objc_msgSend_addActiveVirtualParticipants_(self, v32, v31, v33);
    }
  }
}

- (NSString)clientAddress
{
  return self->_clientAddress;
}

- (void)setClientAddress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end