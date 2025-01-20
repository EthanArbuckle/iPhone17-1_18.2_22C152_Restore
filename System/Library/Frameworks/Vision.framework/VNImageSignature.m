@interface VNImageSignature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNImageSignature)initWithCoder:(id)a3;
- (VNImageSignature)initWithImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5;
- (const)signature;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNImageSignature

- (const)signature
{
  return &self->_signature;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNImageSignature *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (unint64_t nPiRow = self->_signature.nPiRow, nPiRow == v4->_signature.nPiRow)
      && (unint64_t nPiCol = self->_signature.nPiCol, nPiCol == v4->_signature.nPiCol)
      && (size_t v7 = 4 * nPiRow, !memcmp(self->_signature.piRow, v4->_signature.piRow, 4 * nPiRow))
      && !memcmp(self->_signature.piRowTable.sumTable, v4->_signature.piRowTable.sumTable, v7)
      && !memcmp(self->_signature.piRowTable.sumSqTable, v4->_signature.piRowTable.sumSqTable, v7)
      && !memcmp(self->_signature.piCol, v4->_signature.piCol, 4 * nPiCol)
      && !memcmp(self->_signature.piColTable.sumTable, v4->_signature.piColTable.sumTable, 4 * nPiCol)
      && memcmp(self->_signature.piColTable.sumSqTable, v4->_signature.piColTable.sumSqTable, 4 * nPiCol) == 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t nPiRow = self->_signature.nPiRow;
  uint64_t v4 = 4 * nPiRow;
  uint64_t v5 = VNHashMemory((uint64_t)self->_signature.piRow, 4 * nPiRow) ^ __ROR8__(self->_signature.nPiCol | (nPiRow << 15), 51);
  uint64_t v6 = VNHashMemory((uint64_t)self->_signature.piRowTable.sumTable, v4) ^ __ROR8__(v5, 51);
  uint64_t v7 = 4 * self->_signature.nPiCol;
  uint64_t v8 = VNHashMemory((uint64_t)self->_signature.piCol, v7) ^ __ROR8__(v6, 51);
  return VNHashMemory((uint64_t)self->_signature.piColTable.sumSqTable, v7) ^ __ROR8__(v8, 51);
}

- (void)dealloc
{
  free(self->_signature._memoryContainer);
  self->_signature._memoryContainer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNImageSignature;
  [(VNImageSignature *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  piRow = self->_signature.piRow;
  unint64_t nPiRow = self->_signature.nPiRow;
  id v7 = v4;
  uint64_t v8 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:piRow length:4 * nPiRow freeWhenDone:0];
  [v7 encodeObject:v8 forKey:@"rowProjections"];

  unint64_t v10 = self->_signature.nPiRow;
  sumTable = self->_signature.piRowTable.sumTable;
  id v11 = v7;
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:sumTable length:4 * v10 freeWhenDone:0];
  [v11 encodeObject:v12 forKey:@"rowSum"];

  sumSqTable = self->_signature.piRowTable.sumSqTable;
  unint64_t v14 = self->_signature.nPiRow;
  id v15 = v11;
  v16 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:sumSqTable length:4 * v14 freeWhenDone:0];
  [v15 encodeObject:v16 forKey:@"rowSumSq"];

  piCol = self->_signature.piCol;
  unint64_t nPiCol = self->_signature.nPiCol;
  id v19 = v15;
  v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:piCol length:4 * nPiCol freeWhenDone:0];
  [v19 encodeObject:v20 forKey:@"colProjections"];

  unint64_t v22 = self->_signature.nPiCol;
  v21 = self->_signature.piColTable.sumTable;
  id v23 = v19;
  v24 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v21 length:4 * v22 freeWhenDone:0];
  [v23 encodeObject:v24 forKey:@"colSum"];

  v25 = self->_signature.piColTable.sumSqTable;
  unint64_t v26 = self->_signature.nPiCol;
  id v28 = v23;
  v27 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v25 length:4 * v26 freeWhenDone:0];
  [v28 encodeObject:v27 forKey:@"colSumSq"];
}

- (VNImageSignature)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rowProjections"];
  size_t v6 = [v5 length];
  id v7 = (void *)MEMORY[0x1E4F1C3B8];
  if ((v6 & 3) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"inconsistent row data"];
  }
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colProjections"];
  size_t v9 = [v8 length];
  if ((v9 & 3) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"inconsistent column data"];
  }
  unint64_t v10 = [(VNImageSignature *)self init];
  id v11 = v10;
  if (v10
    && FastRegistration_allocateSignatureBuffersForImageDimension((uint64_t)&v10->_signature, v9 >> 2, v6 >> 2) == 4736)
  {
    piRow = v11->_signature.piRow;
    id v13 = v5;
    memcpy(piRow, (const void *)[v13 bytes], v6);
    piCol = v11->_signature.piCol;
    id v15 = v8;
    memcpy(piCol, (const void *)[v15 bytes], v9);
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rowSum"];

    if ([v16 length] != v6) {
      [MEMORY[0x1E4F1CA00] raise:*v7 format:@"inconsistent row data"];
    }
    sumTable = v11->_signature.piRowTable.sumTable;
    id v18 = v16;
    memcpy(sumTable, (const void *)[v18 bytes], v6);
    id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colSum"];

    if ([v19 length] != v9) {
      [MEMORY[0x1E4F1CA00] raise:*v7 format:@"inconsistent column data"];
    }
    v20 = v11->_signature.piColTable.sumTable;
    id v21 = v19;
    memcpy(v20, (const void *)[v21 bytes], v9);
    unint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rowSumSq"];

    if ([v22 length] != v6) {
      [MEMORY[0x1E4F1CA00] raise:*v7 format:@"inconsistent row data"];
    }
    sumSqTable = v11->_signature.piRowTable.sumSqTable;
    id v5 = v22;
    memcpy(sumSqTable, (const void *)[v5 bytes], v6);
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"colSumSq"];

    if ([v24 length] != v9) {
      [MEMORY[0x1E4F1CA00] raise:*v7 format:@"inconsistent column data"];
    }
    v25 = v11->_signature.piColTable.sumSqTable;
    id v8 = v24;
    memcpy(v25, (const void *)[v8 bytes], v9);
    unint64_t v26 = v11;
  }
  else
  {
    unint64_t v26 = 0;
  }

  return v26;
}

- (VNImageSignature)initWithImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  unint64_t v5 = MEMORY[0x1F4188790](self).n128_u64[0];
  id v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = *(double *)&v5;
  v16 = v15;
  STACK[0x7E38] = *MEMORY[0x1E4F143B8];
  id v18 = v17;
  if (v18)
  {
    v47.receiver = v16;
    v47.super_class = (Class)VNImageSignature;
    id v19 = [(VNImageSignature *)&v47 init];
    v20 = v19;
    if (v19)
    {
      v19->_signature._memoryContainer = 0;
      uint64_t v21 = [v18 width];
      uint64_t v22 = [v18 height];
      unint64_t v23 = v21 & 0xFFFFFFFFFFFFFFFELL;
      unint64_t v24 = 2;
      if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0) {
        unint64_t v23 = 2;
      }
      if ((v22 & 0xFFFFFFFFFFFFFFFELL) != 0) {
        unint64_t v24 = v22 & 0xFFFFFFFFFFFFFFFELL;
      }
      v52.origin.x = v14 * (double)v23;
      v52.size.width = v11 * (double)v23;
      v52.origin.y = v13 * (double)v24;
      v52.size.height = v9 * (double)v24;
      CGRect v53 = CGRectIntegral(v52);
      v25 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v53.size.width, (unint64_t)v53.size.height, 875704422, 0, v7, v53.origin.x, v53.origin.y);
      unint64_t v26 = v25;
      if (!v25) {
        goto LABEL_44;
      }
      CVPixelBufferLockBaseAddress(v25, 1uLL);
      BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(v26, 0);
      size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(v26, 0);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v26, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v26, 0);
      uint64_t SignatureBuffersForImageDimension = FastRegistration_allocateSignatureBuffersForImageDimension((uint64_t)&v20->_signature, WidthOfPlane, HeightOfPlane);
      if (SignatureBuffersForImageDimension != 4736) {
        goto LABEL_40;
      }
      piRow = v20->_signature.piRow;
      piCol = v20->_signature.piCol;
      if (HeightOfPlane & 1 | WidthOfPlane & 0x1F) {
        BOOL v34 = 0;
      }
      else {
        BOOL v34 = (BytesPerRowOfPlane & 0x1F | BaseAddressOfPlane & 0xF) == 0;
      }
      if (v34)
      {
        if (!PixelSumASM(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, BytesPerRowOfPlane, (int32x4_t *)&STACK[0x3F20], &block))
        {
          vDSP_vflt32((const int *)&STACK[0x3F20], 1, piRow, 1, (int)HeightOfPlane);
          vDSP_vflt32(block.i32, 1, piCol, 1, (int)WidthOfPlane);
          uint64_t v37 = 4736;
          goto LABEL_31;
        }
        uint64_t v37 = 4732;
      }
      else
      {
        STACK[0x3F20] = (unint64_t)BaseAddressOfPlane;
        LODWORD(STACK[0x3F28]) = WidthOfPlane;
        LODWORD(STACK[0x3F2C]) = (int)HeightOfPlane >> 1;
        STACK[0x3F30] = BytesPerRowOfPlane;
        LODWORD(STACK[0x3F38]) = 1;
        STACK[0x3F40] = (unint64_t)piRow;
        STACK[0x3F50] = (unint64_t)BaseAddressOfPlane->u64
                      + BytesPerRowOfPlane * ((uint64_t)(int)HeightOfPlane >> 1);
        LODWORD(STACK[0x3F58]) = WidthOfPlane;
        LODWORD(STACK[0x3F5C]) = (int)HeightOfPlane >> 1;
        STACK[0x3F60] = BytesPerRowOfPlane;
        LODWORD(STACK[0x3F68]) = 1;
        STACK[0x3F70] = (unint64_t)&piRow[(int)HeightOfPlane >> 1];
        block.i64[0] = MEMORY[0x1E4F143A8];
        block.i64[1] = 0x40000000;
        v49 = __Projections_projectionCols_planar8UtoF_block_invoke;
        v50 = &__block_descriptor_tmp_1_37620;
        v51 = &STACK[0x3F20];
        dispatch_apply(2uLL, 0, &block);
        char v35 = 0;
        uint64_t v36 = 0;
        do
        {
          uint64_t v37 = *(&STACK[0x3F20] + 6 * v36 + 5);
          if (v37 != 4736) {
            break;
          }
          char v38 = v35;
          char v35 = 1;
          uint64_t v36 = 1;
        }
        while ((v38 & 1) == 0);
        if ((v37 & 0x80) != 0)
        {
          STACK[0x3F20] = (unint64_t)BaseAddressOfPlane;
          LODWORD(STACK[0x3F28]) = (int)WidthOfPlane >> 1;
          LODWORD(STACK[0x3F2C]) = HeightOfPlane;
          STACK[0x3F30] = BytesPerRowOfPlane;
          LODWORD(STACK[0x3F38]) = 1;
          STACK[0x3F40] = (unint64_t)piCol;
          STACK[0x3F50] = (unint64_t)BaseAddressOfPlane->u64 + ((int)WidthOfPlane >> 1);
          LODWORD(STACK[0x3F58]) = (int)WidthOfPlane >> 1;
          LODWORD(STACK[0x3F5C]) = HeightOfPlane;
          STACK[0x3F60] = BytesPerRowOfPlane;
          LODWORD(STACK[0x3F68]) = 1;
          STACK[0x3F70] = (unint64_t)&piCol[(int)WidthOfPlane >> 1];
          block.i64[0] = MEMORY[0x1E4F143A8];
          block.i64[1] = 0x40000000;
          v49 = __Projections_projectionRows_planar8UtoF_block_invoke;
          v50 = &__block_descriptor_tmp_37618;
          v51 = &STACK[0x3F20];
          dispatch_apply(2uLL, 0, &block);
          char v39 = 0;
          uint64_t v40 = 0;
          do
          {
            uint64_t v37 = *(&STACK[0x3F20] + 6 * v40 + 5);
            if (v37 != 4736) {
              break;
            }
            char v41 = v39;
            char v39 = 1;
            uint64_t v40 = 1;
          }
          while ((v41 & 1) == 0);
        }
      }
      if ((v37 & 0x80) == 0)
      {
LABEL_37:
        if (v37 == 4736) {
          goto LABEL_38;
        }
        uint64_t SignatureBuffersForImageDimension = 4710;
LABEL_40:
        CVPixelBufferUnlockBaseAddress(v26, 1uLL);
        CVPixelBufferRelease(v26);
        if (SignatureBuffersForImageDimension == 4736)
        {
          v16 = v20;
          v43 = v16;
          goto LABEL_46;
        }
        if (v7)
        {
          +[CVML_Error createNSErrorWithStatus:SignatureBuffersForImageDimension andMessage:@"Error while trying to allocate VNImageSignature object"];
          v43 = 0;
          *id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
          v16 = v20;
          goto LABEL_46;
        }
LABEL_44:
        v43 = 0;
        goto LABEL_45;
      }
LABEL_31:
      v20->_signature.unint64_t nPiCol = WidthOfPlane;
      v20->_signature.unint64_t nPiRow = HeightOfPlane;
      if (v20->_signature.piRowTable.sumSqTable)
      {
        if (v20->_signature.piRowTable.sumTable)
        {
          sumSqTable = v20->_signature.piColTable.sumSqTable;
          if (sumSqTable)
          {
            sumTable = v20->_signature.piColTable.sumTable;
            if (sumTable)
            {
              Projections_computeMeanStdTable(v20->_signature.piCol, WidthOfPlane, sumTable, sumSqTable);
              Projections_computeMeanStdTable(v20->_signature.piRow, v20->_signature.nPiRow, v20->_signature.piRowTable.sumTable, v20->_signature.piRowTable.sumSqTable);
LABEL_38:
              uint64_t SignatureBuffersForImageDimension = 4736;
              goto LABEL_40;
            }
          }
        }
      }
      goto LABEL_37;
    }
    if (v7)
    {
      id v42 = +[VNError errorForMemoryAllocationFailure];
      v16 = 0;
      goto LABEL_25;
    }
    v16 = 0;
LABEL_27:
    v43 = 0;
    goto LABEL_46;
  }
  if (!v7) {
    goto LABEL_27;
  }
  id v42 = +[VNError errorWithCode:14 message:@"nil buffer passed into initWithImageBuffer"];
LABEL_25:
  v43 = 0;
  *id v7 = v42;
LABEL_46:

  return v43;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end