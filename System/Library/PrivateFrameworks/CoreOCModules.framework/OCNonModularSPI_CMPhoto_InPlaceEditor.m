@interface OCNonModularSPI_CMPhoto_InPlaceEditor
- (BOOL)shouldModifyMetadataForImageIndex:(int64_t)a3 payloadIndex:(int64_t)a4 withType:(unint64_t)a5 customMetadataIdentifier:(id)a6;
- (NSArray)modifiedExtrinsicsPosition;
- (NSArray)modifiedExtrinsicsRotation;
- (NSData)modifiedXMP;
- (NSDictionary)modifiedCustom;
- (int)extrinsics:(id)a3 forIndex:(int64_t)a4 modifiedExtrinsics:(id *)a5;
- (int)metadataPayload:(id)a3 forImageIndex:(int64_t)a4 payloadIndex:(int64_t)a5 withType:(unint64_t)a6 customMetadataIdentifier:(id)a7 modifiedData:(id *)a8;
- (void)setModifiedCustom:(id)a3;
- (void)setModifiedExtrinsicsPosition:(id)a3;
- (void)setModifiedExtrinsicsRotation:(id)a3;
- (void)setModifiedXMP:(id)a3;
- (void)updateModifiedCustom:(id)a3;
- (void)updateModifiedExtrinsicsPosition:(id)a3 rotation:(id)a4;
- (void)updateModifiedXMP:(id)a3;
@end

@implementation OCNonModularSPI_CMPhoto_InPlaceEditor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedExtrinsicsRotation, 0);
  objc_storeStrong((id *)&self->_modifiedExtrinsicsPosition, 0);
  objc_storeStrong((id *)&self->_modifiedCustom, 0);
  objc_storeStrong((id *)&self->_modifiedXMP, 0);
}

- (void)setModifiedExtrinsicsRotation:(id)a3
{
}

- (NSArray)modifiedExtrinsicsRotation
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModifiedExtrinsicsPosition:(id)a3
{
}

- (NSArray)modifiedExtrinsicsPosition
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModifiedCustom:(id)a3
{
}

- (NSDictionary)modifiedCustom
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setModifiedXMP:(id)a3
{
}

- (NSData)modifiedXMP
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (int)extrinsics:(id)a3 forIndex:(int64_t)a4 modifiedExtrinsics:(id *)a5
{
  v7 = objc_msgSend_mutableCopy(a3, a2, (uint64_t)a3, a4);
  v10 = objc_msgSend_modifiedExtrinsicsPosition(self, v8, v9);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v11, (uint64_t)v10, *MEMORY[0x263F2F810]);

  v14 = objc_msgSend_modifiedExtrinsicsRotation(self, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v7, v15, (uint64_t)v14, *MEMORY[0x263F2F818]);

  id v16 = v7;
  *a5 = v16;

  return 0;
}

- (int)metadataPayload:(id)a3 forImageIndex:(int64_t)a4 payloadIndex:(int64_t)a5 withType:(unint64_t)a6 customMetadataIdentifier:(id)a7 modifiedData:(id *)a8
{
  id v12 = a3;
  id v13 = a7;
  id v16 = v13;
  if (a6 == 3)
  {
    v18 = objc_msgSend_objectForKeyedSubscript_(v13, v14, *MEMORY[0x263F2F920]);
    int isEqualToString = objc_msgSend_isEqualToString_(v18, v19, @"tag:apple.com,2023:ObjectCapture#ObjectBoundingBox");

    if (isEqualToString)
    {
      v23 = objc_msgSend_modifiedCustom(self, v21, v22);
      objc_msgSend_objectForKeyedSubscript_(v23, v24, *MEMORY[0x263F2F910]);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      int v17 = 0;
      goto LABEL_7;
    }
LABEL_6:
    int v17 = -17102;
    goto LABEL_7;
  }
  if (a6 != 1) {
    goto LABEL_6;
  }
  objc_msgSend_modifiedXMP(self, v14, v15);
  int v17 = 0;
  *a8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v17;
}

- (BOOL)shouldModifyMetadataForImageIndex:(int64_t)a3 payloadIndex:(int64_t)a4 withType:(unint64_t)a5 customMetadataIdentifier:(id)a6
{
  BOOL result = 1;
  if (a5 != 1 && a5 != 4)
  {
    if (a5 == 3)
    {
      v7 = objc_msgSend_objectForKeyedSubscript_(a6, a2, *MEMORY[0x263F2F920], a4);
      char isEqualToString = objc_msgSend_isEqualToString_(v7, v8, @"tag:apple.com,2023:ObjectCapture#ObjectBoundingBox");

      return isEqualToString;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)updateModifiedExtrinsicsPosition:(id)a3 rotation:(id)a4
{
  id v8 = a4;
  objc_msgSend_setModifiedExtrinsicsPosition_(self, v6, (uint64_t)a3);
  objc_msgSend_setModifiedExtrinsicsRotation_(self, v7, (uint64_t)v8);
}

- (void)updateModifiedCustom:(id)a3
{
}

- (void)updateModifiedXMP:(id)a3
{
}

@end