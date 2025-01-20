@interface CoordinatorPromiseSpecification
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CoordinatorPromiseSpecification

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[2] = self->_archiveSize;
  v5[3] = self->_diskSpaceNeeded;
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  v5[5] = self->_promiseType;
  id v8 = [(NSDictionary *)self->_streamingZipOptions copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  *((unsigned char *)v5 + 8) = self->_fastExtraction;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPath, 0);
  objc_storeStrong((id *)&self->_streamingZipOptions, 0);
  objc_storeStrong((id *)&self->_referenceID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end