@interface VNFaceAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (VNFaceAttributeCategory)VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
- (VNFaceAttributeCategory)VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
- (VNFaceAttributeCategory)VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
- (VNFaceAttributeCategory)VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
- (VNFaceAttributeCategory)VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
- (VNFaceAttributeCategory)VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
- (VNFaceAttributeCategory)VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
- (VNFaceAttributeCategory)VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
- (VNFaceAttributeCategory)ageCategory;
- (VNFaceAttributeCategory)baldCategory;
- (VNFaceAttributeCategory)eyesCategory;
- (VNFaceAttributeCategory)faceHairCategory;
- (VNFaceAttributeCategory)facemaskCategory;
- (VNFaceAttributeCategory)genderCategory;
- (VNFaceAttributeCategory)glassesCategory;
- (VNFaceAttributeCategory)hairColorCategory;
- (VNFaceAttributeCategory)makeupCategory;
- (VNFaceAttributeCategory)makeupEyesCategory;
- (VNFaceAttributeCategory)makeupLipsCategory;
- (VNFaceAttributeCategory)smilingCategory;
- (VNFaceAttributeCategory)vNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
- (VNFaceAttributeCategory)vn1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
- (VNFaceAttributeCategory)vn2riiZbQrloRhCzYW56f0rk4N3ROe151S;
- (VNFaceAttributeCategory)vn3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
- (VNFaceAttributeCategory)vn4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
- (VNFaceAttributeCategory)vn7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
- (VNFaceAttributeCategory)vn7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
- (VNFaceAttributeCategory)vn7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
- (VNFaceAttributes)initWithCoder:(id)a3;
- (VNFaceAttributes)initWithRequestRevision:(unint64_t)a3;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)encodeWithCoder:(id)a3;
- (void)setAgeCategory:(id)a3;
- (void)setBaldCategory:(uint64_t)a1;
- (void)setEyesCategory:(uint64_t)a1;
- (void)setFaceHairCategory:(uint64_t)a1;
- (void)setFacemaskCategory:(uint64_t)a1;
- (void)setGlassesCategory:(uint64_t)a1;
- (void)setHairColorCategory:(uint64_t)a1;
- (void)setMakeupEyesCategory:(uint64_t)a1;
- (void)setMakeupLipsCategory:(uint64_t)a1;
- (void)setSmilingCategory:(uint64_t)a1;
- (void)setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:(uint64_t)a1;
- (void)setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:(uint64_t)a1;
- (void)setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:(uint64_t)a1;
- (void)setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:(uint64_t)a1;
- (void)setVN5ui9WkMeVvCBruHiQE1q2r6E9kO1AyrP:(id)a3;
- (void)setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:(uint64_t)a1;
- (void)setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:(uint64_t)a1;
- (void)setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:(uint64_t)a1;
- (void)setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:(uint64_t)a1;
@end

@implementation VNFaceAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_facemaskCategory, 0);
  objc_storeStrong((id *)&self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq, 0);
  objc_storeStrong((id *)&self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk, 0);
  objc_storeStrong((id *)&self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S, 0);
  objc_storeStrong((id *)&self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP, 0);
  objc_storeStrong((id *)&self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk, 0);
  objc_storeStrong((id *)&self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1, 0);
  objc_storeStrong((id *)&self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB, 0);
  objc_storeStrong((id *)&self->_makeupLipsCategory, 0);
  objc_storeStrong((id *)&self->_makeupEyesCategory, 0);
  objc_storeStrong((id *)&self->_makeupCategory, 0);
  objc_storeStrong((id *)&self->_glassesCategory, 0);
  objc_storeStrong((id *)&self->_baldCategory, 0);
  objc_storeStrong((id *)&self->_hairColorCategory, 0);
  objc_storeStrong((id *)&self->_faceHairCategory, 0);
  objc_storeStrong((id *)&self->_smilingCategory, 0);
  objc_storeStrong((id *)&self->_eyesCategory, 0);
  objc_storeStrong((id *)&self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE, 0);

  objc_storeStrong((id *)&self->_ageCategory, 0);
}

- (unint64_t)requestRevision
{
  return self->_requestRevision;
}

- (VNFaceAttributeCategory)vn3iT1YRjjnIuELobV1olJiO1vvItN6Kdq
{
  return self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
}

- (VNFaceAttributeCategory)vNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk
{
  return self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
}

- (VNFaceAttributeCategory)vn2riiZbQrloRhCzYW56f0rk4N3ROe151S
{
  return self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
}

- (VNFaceAttributeCategory)vn7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP
{
  return self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
}

- (VNFaceAttributeCategory)vn7CbCeAogPS2iHE6VQwu6H96xanljtMqk
{
  return self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
}

- (VNFaceAttributeCategory)vn4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1
{
  return self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
}

- (VNFaceAttributeCategory)vn1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB
{
  return self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
}

- (VNFaceAttributeCategory)vn7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (VNFaceAttributeCategory)genderCategory
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (void)setVN5ui9WkMeVvCBruHiQE1q2r6E9kO1AyrP:(id)a3
{
  id v6 = a3;
  v4 = (VNFaceAttributeCategory *)[v6 copy];
  VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
  self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = v4;
}

- (VNFaceAttributeCategory)facemaskCategory
{
  return self->_facemaskCategory;
}

- (VNFaceAttributeCategory)VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq
{
  return self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
}

- (VNFaceAttributeCategory)VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk
{
  return self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
}

- (VNFaceAttributeCategory)VN2riiZbQrloRhCzYW56f0rk4N3ROe151S
{
  return self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
}

- (VNFaceAttributeCategory)VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP
{
  return self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
}

- (VNFaceAttributeCategory)VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk
{
  return self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
}

- (VNFaceAttributeCategory)VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1
{
  return self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
}

- (VNFaceAttributeCategory)VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB
{
  return self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
}

- (VNFaceAttributeCategory)makeupLipsCategory
{
  return self->_makeupLipsCategory;
}

- (VNFaceAttributeCategory)makeupEyesCategory
{
  return self->_makeupEyesCategory;
}

- (VNFaceAttributeCategory)makeupCategory
{
  return self->_makeupCategory;
}

- (VNFaceAttributeCategory)glassesCategory
{
  return self->_glassesCategory;
}

- (VNFaceAttributeCategory)baldCategory
{
  return self->_baldCategory;
}

- (VNFaceAttributeCategory)hairColorCategory
{
  return self->_hairColorCategory;
}

- (VNFaceAttributeCategory)faceHairCategory
{
  return self->_faceHairCategory;
}

- (VNFaceAttributeCategory)smilingCategory
{
  return self->_smilingCategory;
}

- (VNFaceAttributeCategory)eyesCategory
{
  return self->_eyesCategory;
}

- (VNFaceAttributeCategory)VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE
{
  return self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
}

- (void)setAgeCategory:(id)a3
{
  id v6 = a3;
  v4 = (VNFaceAttributeCategory *)[v6 copy];
  ageCategory = self->_ageCategory;
  self->_ageCategory = v4;
}

- (VNFaceAttributeCategory)ageCategory
{
  return self->_ageCategory;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceAttributes *)a3;
  if (self == v4)
  {
    char v60 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNFaceAttributes *)self requestRevision];
      if (v6 != [(VNFaceAttributes *)v5 requestRevision]) {
        goto LABEL_24;
      }
      v7 = [(VNFaceAttributes *)self ageCategory];
      v8 = [(VNFaceAttributes *)v5 ageCategory];
      char v9 = VisionCoreEqualOrNilObjects();

      if ((v9 & 1) == 0) {
        goto LABEL_24;
      }
      v10 = [(VNFaceAttributes *)self VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE];
      v11 = [(VNFaceAttributes *)v5 VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE];
      char v12 = VisionCoreEqualOrNilObjects();

      if ((v12 & 1) == 0) {
        goto LABEL_24;
      }
      v13 = [(VNFaceAttributes *)self eyesCategory];
      v14 = [(VNFaceAttributes *)v5 eyesCategory];
      char v15 = VisionCoreEqualOrNilObjects();

      if ((v15 & 1) == 0) {
        goto LABEL_24;
      }
      v16 = [(VNFaceAttributes *)self smilingCategory];
      v17 = [(VNFaceAttributes *)v5 smilingCategory];
      char v18 = VisionCoreEqualOrNilObjects();

      if ((v18 & 1) == 0) {
        goto LABEL_24;
      }
      v19 = [(VNFaceAttributes *)self faceHairCategory];
      v20 = [(VNFaceAttributes *)v5 faceHairCategory];
      char v21 = VisionCoreEqualOrNilObjects();

      if ((v21 & 1) == 0) {
        goto LABEL_24;
      }
      v22 = [(VNFaceAttributes *)self hairColorCategory];
      v23 = [(VNFaceAttributes *)v5 hairColorCategory];
      char v24 = VisionCoreEqualOrNilObjects();

      if ((v24 & 1) == 0) {
        goto LABEL_24;
      }
      v25 = [(VNFaceAttributes *)self baldCategory];
      v26 = [(VNFaceAttributes *)v5 baldCategory];
      char v27 = VisionCoreEqualOrNilObjects();

      if ((v27 & 1) == 0) {
        goto LABEL_24;
      }
      v28 = [(VNFaceAttributes *)self glassesCategory];
      v29 = [(VNFaceAttributes *)v5 glassesCategory];
      char v30 = VisionCoreEqualOrNilObjects();

      if ((v30 & 1) == 0) {
        goto LABEL_24;
      }
      v31 = [(VNFaceAttributes *)self makeupEyesCategory];
      v32 = [(VNFaceAttributes *)v5 makeupEyesCategory];
      char v33 = VisionCoreEqualOrNilObjects();

      if ((v33 & 1) == 0) {
        goto LABEL_24;
      }
      v34 = [(VNFaceAttributes *)self makeupLipsCategory];
      v35 = [(VNFaceAttributes *)v5 makeupLipsCategory];
      char v36 = VisionCoreEqualOrNilObjects();

      if ((v36 & 1) == 0) {
        goto LABEL_24;
      }
      v37 = [(VNFaceAttributes *)self VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB];
      v38 = [(VNFaceAttributes *)v5 VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB];
      char v39 = VisionCoreEqualOrNilObjects();

      if ((v39 & 1) == 0) {
        goto LABEL_24;
      }
      v40 = [(VNFaceAttributes *)self VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1];
      v41 = [(VNFaceAttributes *)v5 VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1];
      char v42 = VisionCoreEqualOrNilObjects();

      if ((v42 & 1) == 0) {
        goto LABEL_24;
      }
      v43 = [(VNFaceAttributes *)self VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk];
      v44 = [(VNFaceAttributes *)v5 VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk];
      char v45 = VisionCoreEqualOrNilObjects();

      if ((v45 & 1) == 0) {
        goto LABEL_24;
      }
      v46 = [(VNFaceAttributes *)self VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP];
      v47 = [(VNFaceAttributes *)v5 VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP];
      char v48 = VisionCoreEqualOrNilObjects();

      if ((v48 & 1) == 0) {
        goto LABEL_24;
      }
      v49 = [(VNFaceAttributes *)self VN2riiZbQrloRhCzYW56f0rk4N3ROe151S];
      v50 = [(VNFaceAttributes *)v5 VN2riiZbQrloRhCzYW56f0rk4N3ROe151S];
      char v51 = VisionCoreEqualOrNilObjects();

      if ((v51 & 1) == 0) {
        goto LABEL_24;
      }
      v52 = [(VNFaceAttributes *)self VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk];
      v53 = [(VNFaceAttributes *)v5 VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk];
      char v54 = VisionCoreEqualOrNilObjects();

      if ((v54 & 1) == 0) {
        goto LABEL_24;
      }
      v55 = [(VNFaceAttributes *)self VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
      v56 = [(VNFaceAttributes *)v5 VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
      char v57 = VisionCoreEqualOrNilObjects();

      if (v57)
      {
        v58 = [(VNFaceAttributes *)self facemaskCategory];
        v59 = [(VNFaceAttributes *)v5 facemaskCategory];
        char v60 = VisionCoreEqualOrNilObjects();
      }
      else
      {
LABEL_24:
        char v60 = 0;
      }
    }
    else
    {
      char v60 = 0;
    }
  }

  return v60;
}

- (unint64_t)hash
{
  v49.receiver = self;
  v49.super_class = (Class)VNFaceAttributes;
  id v3 = [(VNFaceAttributes *)&v49 hash];
  unint64_t v4 = [(VNFaceAttributes *)self requestRevision];
  v5 = [(VNFaceAttributes *)self ageCategory];
  uint64_t v6 = [v5 hash];

  v7 = [(VNFaceAttributes *)self VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE];
  uint64_t v8 = [v7 hash];

  char v9 = [(VNFaceAttributes *)self eyesCategory];
  uint64_t v10 = [v9 hash];

  v11 = [(VNFaceAttributes *)self smilingCategory];
  uint64_t v12 = [v11 hash];

  v13 = [(VNFaceAttributes *)self faceHairCategory];
  uint64_t v14 = [v13 hash];

  char v15 = [(VNFaceAttributes *)self hairColorCategory];
  uint64_t v16 = [v15 hash];

  v17 = [(VNFaceAttributes *)self baldCategory];
  uint64_t v48 = [v17 hash];

  char v18 = [(VNFaceAttributes *)self glassesCategory];
  uint64_t v47 = [v18 hash];

  v19 = [(VNFaceAttributes *)self makeupEyesCategory];
  uint64_t v46 = [v19 hash];

  v20 = [(VNFaceAttributes *)self makeupLipsCategory];
  uint64_t v45 = [v20 hash];

  char v21 = [(VNFaceAttributes *)self VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB];
  uint64_t v44 = [v21 hash];

  v22 = [(VNFaceAttributes *)self VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1];
  uint64_t v43 = [v22 hash];

  v23 = [(VNFaceAttributes *)self VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk];
  uint64_t v42 = [v23 hash];
  uint64_t v39 = v16;
  uint64_t v40 = v14;
  uint64_t v41 = v12;

  char v24 = [(VNFaceAttributes *)self VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP];
  uint64_t v38 = [v24 hash];
  uint64_t v25 = v10;
  uint64_t v26 = v8;
  uint64_t v27 = v6;

  v28 = [(VNFaceAttributes *)self VN2riiZbQrloRhCzYW56f0rk4N3ROe151S];
  uint64_t v29 = [v28 hash];
  unint64_t v30 = v4;

  v31 = [(VNFaceAttributes *)self VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk];
  uint64_t v32 = [v31 hash];

  char v33 = [(VNFaceAttributes *)self VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq];
  uint64_t v34 = [v33 hash];

  v35 = [(VNFaceAttributes *)self facemaskCategory];
  unint64_t v36 = [v35 hash] ^ __ROR8__(v34 ^ __ROR8__(v32 ^ __ROR8__(v29 ^ __ROR8__(v38 ^ __ROR8__(v42 ^ __ROR8__(v43 ^ __ROR8__(v44 ^ __ROR8__(v45 ^ __ROR8__(v46 ^ __ROR8__(v47 ^ __ROR8__(v48 ^ __ROR8__(v39 ^ __ROR8__(v40 ^ __ROR8__(v41 ^ __ROR8__(v25 ^ __ROR8__(v26 ^ __ROR8__(v27 ^ __ROR8__(v30 ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51), 51);

  return v36;
}

- (id)vn_cloneObject
{
  id v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRequestRevision:self->_requestRevision];
  unint64_t v4 = v3;
  if (v3)
  {
    [v3 setAgeCategory:self->_ageCategory];
    -[VNFaceAttributes setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:]((uint64_t)v4, self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE);
    -[VNFaceAttributes setEyesCategory:]((uint64_t)v4, self->_eyesCategory);
    -[VNFaceAttributes setSmilingCategory:]((uint64_t)v4, self->_smilingCategory);
    -[VNFaceAttributes setFaceHairCategory:]((uint64_t)v4, self->_faceHairCategory);
    -[VNFaceAttributes setHairColorCategory:]((uint64_t)v4, self->_hairColorCategory);
    -[VNFaceAttributes setBaldCategory:]((uint64_t)v4, self->_baldCategory);
    -[VNFaceAttributes setGlassesCategory:]((uint64_t)v4, self->_glassesCategory);
    -[VNFaceAttributes setMakeupEyesCategory:]((uint64_t)v4, self->_makeupEyesCategory);
    -[VNFaceAttributes setMakeupLipsCategory:]((uint64_t)v4, self->_makeupLipsCategory);
    -[VNFaceAttributes setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:]((uint64_t)v4, self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB);
    -[VNFaceAttributes setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:]((uint64_t)v4, self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1);
    -[VNFaceAttributes setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:]((uint64_t)v4, self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk);
    -[VNFaceAttributes setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:]((uint64_t)v4, self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP);
    -[VNFaceAttributes setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:]((uint64_t)v4, self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S);
    -[VNFaceAttributes setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:]((uint64_t)v4, self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk);
    -[VNFaceAttributes setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:]((uint64_t)v4, self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq);
    -[VNFaceAttributes setFacemaskCategory:]((uint64_t)v4, self->_facemaskCategory);
  }

  return v4;
}

- (void)setVN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;

    id v3 = v6;
  }
}

- (void)setEyesCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v4;

    id v3 = v6;
  }
}

- (void)setSmilingCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;

    id v3 = v6;
  }
}

- (void)setFaceHairCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v4;

    id v3 = v6;
  }
}

- (void)setHairColorCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v4;

    id v3 = v6;
  }
}

- (void)setBaldCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v4;

    id v3 = v6;
  }
}

- (void)setGlassesCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v4;

    id v3 = v6;
  }
}

- (void)setMakeupEyesCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v4;

    id v3 = v6;
  }
}

- (void)setMakeupLipsCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;

    id v3 = v6;
  }
}

- (void)setVN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v4;

    id v3 = v6;
  }
}

- (void)setVN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v4;

    id v3 = v6;
  }
}

- (void)setVN7CbCeAogPS2iHE6VQwu6H96xanljtMqk:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 120);
    *(void *)(a1 + 120) = v4;

    id v3 = v6;
  }
}

- (void)setVN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v4;

    id v3 = v6;
  }
}

- (void)setVN2riiZbQrloRhCzYW56f0rk4N3ROe151S:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = v4;

    id v3 = v6;
  }
}

- (void)setVNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v4;

    id v3 = v6;
  }
}

- (void)setVN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v4;

    id v3 = v6;
  }
}

- (void)setFacemaskCategory:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v6 = v3;
    uint64_t v4 = [v3 copy];
    v5 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v4;

    id v3 = v6;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:0];
  [v5 encodeObject:v4 forKey:@"VNFaceAttributesVersion"];

  [v5 encodeInteger:self->_requestRevision forKey:@"farRev"];
  [v5 encodeObject:self->_ageCategory forKey:@"age_Cat"];
  [v5 encodeObject:self->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE forKey:@"gender_Cat"];
  [v5 encodeObject:self->_eyesCategory forKey:@"eyes_Cat"];
  [v5 encodeObject:self->_smilingCategory forKey:@"smiling_Cat"];
  [v5 encodeObject:self->_faceHairCategory forKey:@"facehair_Cat"];
  [v5 encodeObject:self->_hairColorCategory forKey:@"haircolor_Cat"];
  [v5 encodeObject:self->_baldCategory forKey:@"bald_Cat"];
  [v5 encodeObject:self->_glassesCategory forKey:@"glasses_Cat"];
  [v5 encodeObject:self->_makeupEyesCategory forKey:@"makeupEyes_Cat"];
  [v5 encodeObject:self->_makeupLipsCategory forKey:@"makeupLips_Cat"];
  [v5 encodeObject:self->_facemaskCategory forKey:@"facemask_Cat"];
  [v5 encodeObject:self->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB forKey:@"unknown01_Cat"];
  [v5 encodeObject:self->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1 forKey:@"unknown02_Cat"];
  [v5 encodeObject:self->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk forKey:@"unknown03_Cat"];
  [v5 encodeObject:self->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP forKey:@"unknown04_Cat"];
  [v5 encodeObject:self->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S forKey:@"unknown05_Cat"];
  [v5 encodeObject:self->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk forKey:@"unknown06_Cat"];
  [v5 encodeObject:self->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq forKey:@"unknown07_Cat"];
}

- (VNFaceAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"VNFaceAttributesVersion"];
  id v6 = v5;
  if (v5 && ![v5 unsignedIntValue])
  {
    v7 = -[VNFaceAttributes initWithRequestRevision:](self, "initWithRequestRevision:", [v4 decodeIntegerForKey:@"farRev"]);
    if (v7)
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = [v4 decodeObjectOfClass:v9 forKey:@"age_Cat"];
      ageCategory = v7->_ageCategory;
      v7->_ageCategory = (VNFaceAttributeCategory *)v10;

      uint64_t v12 = [v4 decodeObjectOfClass:v9 forKey:@"gender_Cat"];
      VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = v7->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE;
      v7->_VN7exwFFmQF0AI9P7FjBljwEFu7QYUGCYE = (VNFaceAttributeCategory *)v12;

      uint64_t v14 = [v4 decodeObjectOfClass:v9 forKey:@"eyes_Cat"];
      eyesCategory = v7->_eyesCategory;
      v7->_eyesCategory = (VNFaceAttributeCategory *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:v9 forKey:@"smiling_Cat"];
      smilingCategory = v7->_smilingCategory;
      v7->_smilingCategory = (VNFaceAttributeCategory *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:v9 forKey:@"facehair_Cat"];
      faceHairCategory = v7->_faceHairCategory;
      v7->_faceHairCategory = (VNFaceAttributeCategory *)v18;

      uint64_t v20 = [v4 decodeObjectOfClass:v9 forKey:@"haircolor_Cat"];
      hairColorCategory = v7->_hairColorCategory;
      v7->_hairColorCategory = (VNFaceAttributeCategory *)v20;

      uint64_t v22 = [v4 decodeObjectOfClass:v9 forKey:@"bald_Cat"];
      baldCategory = v7->_baldCategory;
      v7->_baldCategory = (VNFaceAttributeCategory *)v22;

      uint64_t v24 = [v4 decodeObjectOfClass:v9 forKey:@"glasses_Cat"];
      glassesCategory = v7->_glassesCategory;
      v7->_glassesCategory = (VNFaceAttributeCategory *)v24;

      uint64_t v26 = [v4 decodeObjectOfClass:v9 forKey:@"facemask_Cat"];
      facemaskCategory = v7->_facemaskCategory;
      v7->_facemaskCategory = (VNFaceAttributeCategory *)v26;

      if ([v4 containsValueForKey:@"makeup_Cat"])
      {
        uint64_t v28 = [v4 decodeObjectOfClass:v9 forKey:@"makeup_Cat"];
        makeupCategory = v7->_makeupCategory;
        v7->_makeupCategory = (VNFaceAttributeCategory *)v28;
      }
      else
      {
        uint64_t v30 = [v4 decodeObjectOfClass:v9 forKey:@"makeupEyes_Cat"];
        makeupEyesCategory = v7->_makeupEyesCategory;
        v7->_makeupEyesCategory = (VNFaceAttributeCategory *)v30;

        uint64_t v32 = [v4 decodeObjectOfClass:v9 forKey:@"makeupLips_Cat"];
        makeupCategory = v7->_makeupLipsCategory;
        v7->_makeupLipsCategory = (VNFaceAttributeCategory *)v32;
      }

      if ([v4 containsValueForKey:@"unknown01_Cat"])
      {
        uint64_t v33 = [v4 decodeObjectOfClass:v9 forKey:@"unknown01_Cat"];
        VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB = v7->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB;
        v7->_VN1uMyFtnYEWjbrdx3yAuDndKkPeyzNJhB = (VNFaceAttributeCategory *)v33;

        uint64_t v35 = [v4 decodeObjectOfClass:v9 forKey:@"unknown02_Cat"];
        VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1 = v7->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1;
        v7->_VN4UfLbvVUqMvYV8bbGFQcxg5yRLm8ekI1 = (VNFaceAttributeCategory *)v35;

        uint64_t v37 = [v4 decodeObjectOfClass:v9 forKey:@"unknown03_Cat"];
        VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk = v7->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk;
        v7->_VN7CbCeAogPS2iHE6VQwu6H96xanljtMqk = (VNFaceAttributeCategory *)v37;

        uint64_t v39 = [v4 decodeObjectOfClass:v9 forKey:@"unknown04_Cat"];
        VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP = v7->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP;
        v7->_VN7fiLHgGnvqPqG63cfDUCK4Xm8obUuWoP = (VNFaceAttributeCategory *)v39;

        uint64_t v41 = [v4 decodeObjectOfClass:v9 forKey:@"unknown05_Cat"];
        VN2riiZbQrloRhCzYW56f0rk4N3ROe151S = v7->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S;
        v7->_VN2riiZbQrloRhCzYW56f0rk4N3ROe151S = (VNFaceAttributeCategory *)v41;

        uint64_t v43 = [v4 decodeObjectOfClass:v9 forKey:@"unknown06_Cat"];
        VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk = v7->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk;
        v7->_VNpLorzxnyAlLcPFNcKhgoNCmy9b5BRWyk = (VNFaceAttributeCategory *)v43;

        uint64_t v45 = [v4 decodeObjectOfClass:v9 forKey:@"unknown07_Cat"];
        VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq = v7->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq;
        v7->_VN3iT1YRjjnIuELobV1olJiO1vvItN6Kdq = (VNFaceAttributeCategory *)v45;
      }
      self = v7;
      v7 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (VNFaceAttributes)initWithRequestRevision:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNFaceAttributes;
  id v4 = [(VNFaceAttributes *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_requestRevision = a3;
    id v6 = v4;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end