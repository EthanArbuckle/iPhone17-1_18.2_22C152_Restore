@interface MTRUnitTestingClusterTestListStructOctet
- (MTRUnitTestingClusterTestListStructOctet)init;
- (NSData)member2;
- (NSNumber)member1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMember1:(NSNumber *)member1;
- (void)setMember2:(NSData *)member2;
@end

@implementation MTRUnitTestingClusterTestListStructOctet

- (MTRUnitTestingClusterTestListStructOctet)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTRUnitTestingClusterTestListStructOctet;
  v2 = [(MTRUnitTestingClusterTestListStructOctet *)&v10 init];
  v3 = v2;
  if (v2)
  {
    member1 = v2->_member1;
    v2->_member1 = (NSNumber *)&unk_26F9C8620;

    uint64_t v7 = objc_msgSend_data(MEMORY[0x263EFF8F8], v5, v6);
    member2 = v3->_member2;
    v3->_member2 = (NSData *)v7;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRUnitTestingClusterTestListStructOctet);
  uint64_t v7 = objc_msgSend_member1(self, v5, v6);
  objc_msgSend_setMember1_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_member2(self, v9, v10);
  objc_msgSend_setMember2_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  member1 = self->_member1;
  v8 = objc_msgSend_base64EncodedStringWithOptions_(self->_member2, v7, 0);
  uint64_t v10 = objc_msgSend_stringWithFormat_(v3, v9, @"<%@: member1:%@ member2:%@; >", v5, member1, v8);;

  return v10;
}

- (NSNumber)member1
{
  return self->_member1;
}

- (void)setMember1:(NSNumber *)member1
{
}

- (NSData)member2
{
  return self->_member2;
}

- (void)setMember2:(NSData *)member2
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_member2, 0);

  objc_storeStrong((id *)&self->_member1, 0);
}

@end