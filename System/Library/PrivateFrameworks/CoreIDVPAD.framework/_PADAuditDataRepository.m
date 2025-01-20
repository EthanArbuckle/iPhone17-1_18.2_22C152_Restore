@interface _PADAuditDataRepository
- (_PADAuditDataRepository)init;
- (void)storeClassifierResult:(id)a3 imageData:(id)a4 signature:(id)a5 flags:(id)a6;
- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5;
- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4;
- (void)storeTAValues:(id)a3;
- (void)storeUnencryptedVideoFrom:(id)a3;
@end

@implementation _PADAuditDataRepository

- (_PADAuditDataRepository)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PADAuditDataRepository;
  v2 = [(_PADAuditDataRepository *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC10CoreIDVPAD30PADInternalAuditDataRepository);
    auditDataRepository = v2->_auditDataRepository;
    v2->_auditDataRepository = v3;
  }
  return v2;
}

- (void)storeClassifierResult:(id)a3 imageData:(id)a4 signature:(id)a5 flags:(id)a6
{
}

- (void)storeUnencryptedVideoFrom:(id)a3
{
}

- (void)storePRDBuffer:(__CVBuffer *)a3 name:(id)a4
{
}

- (void)storeFACPoseBuffer:(__CVBuffer *)a3 identifier:(id)a4 values:(id)a5
{
}

- (void)storeTAValues:(id)a3
{
}

- (void).cxx_destruct
{
}

@end