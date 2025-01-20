@interface ANSTFace
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANST3DPoseEstimate)poseEstimate;
- (ANSTEyeBlinkEstimate)eyeBlinkEstimate;
- (ANSTEyeRectEstimate)eyeRectEstimate;
- (ANSTFace)init;
- (ANSTFace)initWithAcFace:(id *)a3;
- (ANSTFace)initWithAcObject:(id *)a3;
- (ANSTFace)initWithCoder:(id)a3;
- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7;
- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 frontal:(BOOL)a8 faceMaskConfidence:(int64_t)a9 eyeCoveringConfidence:(int64_t)a10 poseEstimate:(id)a11 skinToneEstimate:(id)a12 smileEstimate:(id)a13 eyeBlinkEstimate:(id)a14 eyeRectEstimate:(id)a15;
- (ANSTSkinToneEstimate)skinToneEstimate;
- (ANSTSmileEstimate)smileEstimate;
- (BOOL)eyeBlinkEstimateExists;
- (BOOL)eyeRectEstimateExists;
- (BOOL)isFrontal;
- (BOOL)poseEstimateExists;
- (BOOL)skinToneEstimateExists;
- (BOOL)smileEstimateExists;
- (id)debugJSONDictionary;
- (id)description;
- (int64_t)eyeCoveringConfidence;
- (int64_t)faceMaskConfidence;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANSTFace

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)init
{
  id result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7
{
  id v9 = a5;
  id result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, v10, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithAcObject:(id *)a3
{
  id result = (ANSTFace *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTFace)initWithAcFace:(id *)a3
{
  if (a3->var15)
  {
    v5 = [ANST3DPoseEstimate alloc];
    v7 = objc_msgSend_initWithYaw_roll_refinedYaw_refinedRoll_refinedPitch_(v5, v6, a3->var5, a3->var6, a3->var7, a3->var8, a3->var9);
  }
  else
  {
    v7 = 0;
  }
  if (a3->var38)
  {
    v8 = [ANSTSkinToneEstimate alloc];
    v10 = objc_msgSend_initWithTypeIConfidence_typeIIConfidence_typeIIIConfidence_typeIVConfidence_typeVConfidence_typeVIConfidence_(v8, v9, a3->var27, a3->var28, a3->var29, a3->var30, a3->var31, a3->var32);
  }
  else
  {
    v10 = 0;
  }
  if (a3->var18)
  {
    v11 = [ANSTSmileEstimate alloc];
    v13 = objc_msgSend_initWithSmile_(v11, v12, a3->var10);
  }
  else
  {
    v13 = 0;
  }
  if (a3->var17)
  {
    v14 = [ANSTEyeBlinkEstimate alloc];
    v16 = objc_msgSend_initWithBlinkLeft_blinkRight_(v14, v15, a3->var11, a3->var12);
  }
  else
  {
    v16 = 0;
  }
  if (a3->var16)
  {
    v17 = [ANSTEyeRectEstimate alloc];
    v20 = objc_msgSend_initWithEyeRectLeft_eyeRectRight_(v17, v18, v19, a3->var13.var0, a3->var13.var1, a3->var13.var2, a3->var13.var3, a3->var14.var0, a3->var14.var1, a3->var14.var2, a3->var14.var3);
  }
  else
  {
    v20 = 0;
  }
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  v23 = ANSTObjectCategoryFromAcDetCategory(a3->var2);
  v25 = (ANSTFace *)objc_msgSend_initWithObjectID_groupID_category_boundingBox_confidence_frontal_faceMaskConfidence_eyeCoveringConfidence_poseEstimate_skinToneEstimate_smileEstimate_eyeBlinkEstimate_eyeRectEstimate_(self, v24, var0, var1, v23, a3->var4, a3->var19 != 0, a3->var23, a3->var3.var0, a3->var3.var1, a3->var3.var2, a3->var3.var3, a3->var26, v7, v10, v13, v16, v20);

  return v25;
}

- (ANSTFace)initWithObjectID:(unint64_t)a3 groupID:(unint64_t)a4 category:(id)a5 boundingBox:(CGRect)a6 confidence:(unint64_t)a7 frontal:(BOOL)a8 faceMaskConfidence:(int64_t)a9 eyeCoveringConfidence:(int64_t)a10 poseEstimate:(id)a11 skinToneEstimate:(id)a12 smileEstimate:(id)a13 eyeBlinkEstimate:(id)a14 eyeRectEstimate:(id)a15
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v24 = (ANST3DPoseEstimate *)a11;
  v25 = (ANSTSkinToneEstimate *)a12;
  v26 = (ANSTSmileEstimate *)a13;
  v27 = (ANSTEyeBlinkEstimate *)a14;
  v41 = (ANSTEyeRectEstimate *)a15;
  v42.receiver = self;
  v42.super_class = (Class)ANSTFace;
  v28 = -[ANSTObject initWithObjectID:groupID:category:boundingBox:confidence:](&v42, sel_initWithObjectID_groupID_category_boundingBox_confidence_, a3, a4, a5, a7, x, y, width, height);
  v28->_frontal = a8;
  v28->_faceMaskConfidence = a9;
  v28->_eyeCoveringConfidence = a10;
  poseEstimate = v28->_poseEstimate;
  v28->_poseEstimate = v24;
  v30 = v24;

  v28->_poseEstimateExists = v30 != 0;
  skinToneEstimate = v28->_skinToneEstimate;
  v28->_skinToneEstimate = v25;
  v32 = v25;

  v28->_skinToneEstimateExists = v32 != 0;
  smileEstimate = v28->_smileEstimate;
  v28->_smileEstimate = v26;
  v34 = v26;

  v28->_smileEstimateExists = v34 != 0;
  eyeBlinkEstimate = v28->_eyeBlinkEstimate;
  v28->_eyeBlinkEstimate = v27;
  v36 = v27;

  v28->_eyeBlinkEstimateExists = v36 != 0;
  eyeRectEstimate = v28->_eyeRectEstimate;
  v28->_eyeRectEstimate = v41;

  v28->_eyeRectEstimateExists = v41 != 0;
  return v28;
}

- (ANSTFace)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ANSTFace;
  v5 = [(ANSTObject *)&v29 initWithCoder:v4];
  v6 = v5;
  if (!v5) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v5->_frontal, sel_isFrontal)) {
    goto LABEL_21;
  }
  if (!sub_246D69F54(v4, &v6->_faceMaskConfidence, sel_faceMaskConfidence)) {
    goto LABEL_21;
  }
  if (!sub_246D69F54(v4, &v6->_eyeCoveringConfidence, sel_eyeCoveringConfidence)) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v6->_poseEstimateExists, sel_poseEstimateExists)) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v6->_skinToneEstimateExists, sel_skinToneEstimateExists)) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v6->_smileEstimateExists, sel_smileEstimateExists)) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v6->_eyeBlinkEstimateExists, sel_eyeBlinkEstimateExists)) {
    goto LABEL_21;
  }
  if (!sub_246D6B880(v4, &v6->_eyeRectEstimateExists, sel_eyeRectEstimateExists)) {
    goto LABEL_21;
  }
  if (v6->_poseEstimateExists)
  {
    v7 = [ANST3DPoseEstimate alloc];
    uint64_t v9 = objc_msgSend_initWithCoder_(v7, v8, (uint64_t)v4);
    poseEstimate = v6->_poseEstimate;
    v6->_poseEstimate = (ANST3DPoseEstimate *)v9;

    if (!v6->_poseEstimate) {
      goto LABEL_21;
    }
  }
  if (v6->_skinToneEstimateExists)
  {
    v11 = [ANSTSkinToneEstimate alloc];
    uint64_t v13 = objc_msgSend_initWithCoder_(v11, v12, (uint64_t)v4);
    skinToneEstimate = v6->_skinToneEstimate;
    v6->_skinToneEstimate = (ANSTSkinToneEstimate *)v13;

    if (!v6->_skinToneEstimate) {
      goto LABEL_21;
    }
  }
  if (v6->_smileEstimateExists)
  {
    v15 = [ANSTSmileEstimate alloc];
    uint64_t v17 = objc_msgSend_initWithCoder_(v15, v16, (uint64_t)v4);
    smileEstimate = v6->_smileEstimate;
    v6->_smileEstimate = (ANSTSmileEstimate *)v17;

    if (!v6->_smileEstimate) {
      goto LABEL_21;
    }
  }
  if (v6->_eyeBlinkEstimateExists)
  {
    uint64_t v19 = [ANSTEyeBlinkEstimate alloc];
    uint64_t v21 = objc_msgSend_initWithCoder_(v19, v20, (uint64_t)v4);
    eyeBlinkEstimate = v6->_eyeBlinkEstimate;
    v6->_eyeBlinkEstimate = (ANSTEyeBlinkEstimate *)v21;

    if (!v6->_eyeBlinkEstimate) {
      goto LABEL_21;
    }
  }
  if (!v6->_eyeRectEstimateExists
    || (v23 = [ANSTEyeRectEstimate alloc],
        uint64_t v25 = objc_msgSend_initWithCoder_(v23, v24, (uint64_t)v4),
        eyeRectEstimate = v6->_eyeRectEstimate,
        v6->_eyeRectEstimate = (ANSTEyeRectEstimate *)v25,
        eyeRectEstimate,
        v6->_eyeRectEstimate))
  {
    v27 = v6;
  }
  else
  {
LABEL_21:
    v27 = 0;
  }

  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ANSTFace;
  [(ANSTObject *)&v20 encodeWithCoder:v4];
  sub_246D6BB74(v4, self->_frontal, sel_isFrontal);
  sub_246D6A070(v4, self->_faceMaskConfidence, sel_faceMaskConfidence);
  sub_246D6A070(v4, self->_eyeCoveringConfidence, sel_eyeCoveringConfidence);
  sub_246D6BB74(v4, self->_poseEstimateExists, sel_poseEstimateExists);
  poseEstimate = self->_poseEstimate;
  if (poseEstimate)
  {
    v6 = NSStringFromSelector(sel_poseEstimate);
    objc_msgSend_encodeObject_forKey_(v4, v7, (uint64_t)poseEstimate, v6);
  }
  sub_246D6BB74(v4, self->_skinToneEstimateExists, sel_skinToneEstimateExists);
  skinToneEstimate = self->_skinToneEstimate;
  if (skinToneEstimate)
  {
    uint64_t v9 = NSStringFromSelector(sel_skinToneEstimate);
    objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)skinToneEstimate, v9);
  }
  sub_246D6BB74(v4, self->_smileEstimateExists, sel_smileEstimateExists);
  smileEstimate = self->_smileEstimate;
  if (smileEstimate)
  {
    v12 = NSStringFromSelector(sel_smileEstimate);
    objc_msgSend_encodeObject_forKey_(v4, v13, (uint64_t)smileEstimate, v12);
  }
  sub_246D6BB74(v4, self->_eyeBlinkEstimateExists, sel_eyeBlinkEstimateExists);
  eyeBlinkEstimate = self->_eyeBlinkEstimate;
  if (eyeBlinkEstimate)
  {
    v15 = NSStringFromSelector(sel_eyeBlinkEstimate);
    objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)eyeBlinkEstimate, v15);
  }
  sub_246D6BB74(v4, self->_eyeRectEstimateExists, sel_eyeRectEstimateExists);
  eyeRectEstimate = self->_eyeRectEstimate;
  if (eyeRectEstimate)
  {
    v18 = NSStringFromSelector(sel_eyeRectEstimate);
    objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)eyeRectEstimate, v18);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANSTFace %p> {\n", self);
  uint64_t v7 = objc_msgSend_objectID(self, v5, v6);
  objc_msgSend_appendFormat_(v3, v8, @"    objectID            %lu\n", v7);
  v11 = objc_msgSend_category(self, v9, v10);
  objc_msgSend_appendFormat_(v3, v12, @"    category            %@\n", v11);

  objc_msgSend_boundingBox(self, v13, v14);
  uint64_t v19 = sub_246D6990C(v15, v16, v17, v18);
  objc_msgSend_appendFormat_(v3, v20, @"    boundingBox         %@\n", v19);

  uint64_t v23 = objc_msgSend_confidence(self, v21, v22);
  objc_msgSend_appendFormat_(v3, v24, @"    confidence          %lu\n\n", v23);
  if (self->_frontal) {
    objc_msgSend_appendFormat_(v3, v25, @"    isFrontal           %@\n", @"YES");
  }
  else {
    objc_msgSend_appendFormat_(v3, v25, @"    isFrontal           %@\n", @"NO");
  }
  objc_msgSend_appendFormat_(v3, v26, @"    faceMaskConf        %ld\n", self->_faceMaskConfidence);
  objc_msgSend_appendFormat_(v3, v27, @"    eyeCoverConf        %ld\n\n", self->_eyeCoveringConfidence);
  if (self->_poseEstimate)
  {
    v30 = objc_msgSend_poseEstimate(self, v28, v29);
    uint64_t v33 = objc_msgSend_yaw(v30, v31, v32);
    objc_msgSend_appendFormat_(v3, v34, @"    yaw                 %ld\n", v33);

    v37 = objc_msgSend_poseEstimate(self, v35, v36);
    uint64_t v40 = objc_msgSend_roll(v37, v38, v39);
    objc_msgSend_appendFormat_(v3, v41, @"    roll                %ld\n", v40);

    v44 = objc_msgSend_poseEstimate(self, v42, v43);
    uint64_t v47 = objc_msgSend_refinedYaw(v44, v45, v46);
    objc_msgSend_appendFormat_(v3, v48, @"    refinedYaw          %ld\n", v47);

    v51 = objc_msgSend_poseEstimate(self, v49, v50);
    uint64_t v54 = objc_msgSend_refinedRoll(v51, v52, v53);
    objc_msgSend_appendFormat_(v3, v55, @"    refinedRoll         %ld\n", v54);

    v58 = objc_msgSend_poseEstimate(self, v56, v57);
    uint64_t v61 = objc_msgSend_refinedPitch(v58, v59, v60);
    objc_msgSend_appendFormat_(v3, v62, @"    refinedPitch        %ld\n\n", v61);
  }
  else
  {
    objc_msgSend_appendString_(v3, v28, @"    poseEstimate        nil\n\n");
  }
  if (self->_skinToneEstimate)
  {
    v65 = objc_msgSend_skinToneEstimate(self, v63, v64);
    uint64_t v68 = objc_msgSend_typeIConfidence(v65, v66, v67);
    objc_msgSend_appendFormat_(v3, v69, @"    skinToneTypeIConf   %ld\n", v68);

    v72 = objc_msgSend_skinToneEstimate(self, v70, v71);
    uint64_t v75 = objc_msgSend_typeIIConfidence(v72, v73, v74);
    objc_msgSend_appendFormat_(v3, v76, @"    skinToneTypeIIConf  %ld\n", v75);

    v79 = objc_msgSend_skinToneEstimate(self, v77, v78);
    uint64_t v82 = objc_msgSend_typeIIIConfidence(v79, v80, v81);
    objc_msgSend_appendFormat_(v3, v83, @"    skinToneTypeIIIConf %ld\n", v82);

    v86 = objc_msgSend_skinToneEstimate(self, v84, v85);
    uint64_t v89 = objc_msgSend_typeIVConfidence(v86, v87, v88);
    objc_msgSend_appendFormat_(v3, v90, @"    skinToneTypeIVConf  %ld\n", v89);

    v93 = objc_msgSend_skinToneEstimate(self, v91, v92);
    uint64_t v96 = objc_msgSend_typeVConfidence(v93, v94, v95);
    objc_msgSend_appendFormat_(v3, v97, @"    skinToneTypeVConf   %ld\n", v96);

    v100 = objc_msgSend_skinToneEstimate(self, v98, v99);
    uint64_t v103 = objc_msgSend_typeVIConfidence(v100, v101, v102);
    objc_msgSend_appendFormat_(v3, v104, @"    skinToneTypeVIConf  %ld\n\n", v103);
  }
  else
  {
    objc_msgSend_appendString_(v3, v63, @"    skinToneEstimate    nil\n\n");
  }
  if (self->_smileEstimate)
  {
    v107 = objc_msgSend_smileEstimate(self, v105, v106);
    uint64_t v110 = objc_msgSend_smile(v107, v108, v109);
    objc_msgSend_appendFormat_(v3, v111, @"    smile               %ld\n\n", v110);
  }
  else
  {
    objc_msgSend_appendString_(v3, v105, @"    smileEstimate       nil\n\n");
  }
  if (self->_eyeBlinkEstimate)
  {
    v114 = objc_msgSend_eyeBlinkEstimate(self, v112, v113);
    uint64_t v117 = objc_msgSend_blinkLeft(v114, v115, v116);
    objc_msgSend_appendFormat_(v3, v118, @"    blinkLeft           %ld\n", v117);

    v121 = objc_msgSend_eyeBlinkEstimate(self, v119, v120);
    uint64_t v124 = objc_msgSend_blinkRight(v121, v122, v123);
    objc_msgSend_appendFormat_(v3, v125, @"    blinkRight          %ld\n\n", v124);
  }
  else
  {
    objc_msgSend_appendString_(v3, v112, @"    eyeBlinkEstimate    nil\n\n");
  }
  if (self->_eyeRectEstimate)
  {
    v128 = objc_msgSend_eyeRectEstimate(self, v126, v127);
    objc_msgSend_eyeRectLeft(v128, v129, v130);
    v135 = sub_246D6990C(v131, v132, v133, v134);
    objc_msgSend_appendFormat_(v3, v136, @"    eyeRectLeft         %@\n", v135);

    v139 = objc_msgSend_eyeRectEstimate(self, v137, v138);
    objc_msgSend_eyeRectRight(v139, v140, v141);
    v146 = sub_246D6990C(v142, v143, v144, v145);
    objc_msgSend_appendFormat_(v3, v147, @"    eyeRectRight        %@\n", v146);
  }
  else
  {
    objc_msgSend_appendString_(v3, v126, @"    eyeRectEstimate     nil\n\n");
  }
  objc_msgSend_appendString_(v3, v148, @"}");
  v151 = objc_msgSend_copy(v3, v149, v150);

  return v151;
}

- (id)debugJSONDictionary
{
  v149.receiver = self;
  v149.super_class = (Class)ANSTFace;
  id v3 = [(ANSTObject *)&v149 debugJSONDictionary];
  uint64_t v6 = objc_msgSend_mutableCopy(v3, v4, v5);

  v8 = objc_msgSend_numberWithBool_(NSNumber, v7, self->_frontal);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v9, (uint64_t)v8, @"isFrontal");

  v11 = objc_msgSend_numberWithInteger_(NSNumber, v10, self->_faceMaskConfidence);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v12, (uint64_t)v11, @"faceMaskConfidence");

  uint64_t v14 = objc_msgSend_numberWithInteger_(NSNumber, v13, self->_eyeCoveringConfidence);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v15, (uint64_t)v14, @"eyeCoveringConfidence");

  CGFloat v17 = objc_msgSend_numberWithBool_(NSNumber, v16, self->_poseEstimateExists);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v18, (uint64_t)v17, @"hasPoseData");

  if (self->_poseEstimateExists)
  {
    uint64_t v21 = NSNumber;
    uint64_t v22 = objc_msgSend_yaw(self->_poseEstimate, v19, v20);
    v24 = objc_msgSend_numberWithInteger_(v21, v23, v22);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v25, (uint64_t)v24, @"yaw");

    v26 = NSNumber;
    uint64_t v29 = objc_msgSend_roll(self->_poseEstimate, v27, v28);
    v31 = objc_msgSend_numberWithInteger_(v26, v30, v29);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v32, (uint64_t)v31, @"roll");

    uint64_t v33 = NSNumber;
    uint64_t v36 = objc_msgSend_refinedYaw(self->_poseEstimate, v34, v35);
    v38 = objc_msgSend_numberWithInteger_(v33, v37, v36);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v39, (uint64_t)v38, @"refinedYaw");

    uint64_t v40 = NSNumber;
    uint64_t v43 = objc_msgSend_refinedRoll(self->_poseEstimate, v41, v42);
    v45 = objc_msgSend_numberWithInteger_(v40, v44, v43);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v46, (uint64_t)v45, @"refinedRoll");

    uint64_t v47 = NSNumber;
    uint64_t v50 = objc_msgSend_refinedPitch(self->_poseEstimate, v48, v49);
    v52 = objc_msgSend_numberWithInteger_(v47, v51, v50);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v53, (uint64_t)v52, @"refinedPitch");
  }
  uint64_t v54 = objc_msgSend_numberWithBool_(NSNumber, v19, self->_skinToneEstimateExists);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v55, (uint64_t)v54, @"hasSkinToneData");

  if (self->_skinToneEstimateExists)
  {
    v58 = NSNumber;
    uint64_t v59 = objc_msgSend_typeIConfidence(self->_skinToneEstimate, v56, v57);
    uint64_t v61 = objc_msgSend_numberWithInteger_(v58, v60, v59);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v62, (uint64_t)v61, @"skintoneTypeI");

    v63 = NSNumber;
    uint64_t v66 = objc_msgSend_typeIIConfidence(self->_skinToneEstimate, v64, v65);
    uint64_t v68 = objc_msgSend_numberWithInteger_(v63, v67, v66);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v69, (uint64_t)v68, @"skintoneTypeII");

    v70 = NSNumber;
    uint64_t v73 = objc_msgSend_typeIIIConfidence(self->_skinToneEstimate, v71, v72);
    uint64_t v75 = objc_msgSend_numberWithInteger_(v70, v74, v73);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v76, (uint64_t)v75, @"skintoneTypeIII");

    v77 = NSNumber;
    uint64_t v80 = objc_msgSend_typeIVConfidence(self->_skinToneEstimate, v78, v79);
    uint64_t v82 = objc_msgSend_numberWithInteger_(v77, v81, v80);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v83, (uint64_t)v82, @"skintoneTypeIV");

    v84 = NSNumber;
    uint64_t v87 = objc_msgSend_typeVConfidence(self->_skinToneEstimate, v85, v86);
    uint64_t v89 = objc_msgSend_numberWithInteger_(v84, v88, v87);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v90, (uint64_t)v89, @"skintoneTypeV");

    v91 = NSNumber;
    uint64_t v94 = objc_msgSend_typeVIConfidence(self->_skinToneEstimate, v92, v93);
    uint64_t v96 = objc_msgSend_numberWithInteger_(v91, v95, v94);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v97, (uint64_t)v96, @"skintoneTypeVI");
  }
  v98 = objc_msgSend_numberWithBool_(NSNumber, v56, self->_smileEstimateExists);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v99, (uint64_t)v98, @"hasSmileData");

  if (self->_smileEstimateExists)
  {
    uint64_t v102 = NSNumber;
    uint64_t v103 = objc_msgSend_smile(self->_smileEstimate, v100, v101);
    v105 = objc_msgSend_numberWithInteger_(v102, v104, v103);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v106, (uint64_t)v105, @"smile");
  }
  v107 = objc_msgSend_numberWithBool_(NSNumber, v100, self->_eyeBlinkEstimateExists);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v108, (uint64_t)v107, @"hasBlinkData");

  if (self->_eyeBlinkEstimateExists)
  {
    v111 = NSNumber;
    uint64_t v112 = objc_msgSend_blinkLeft(self->_eyeBlinkEstimate, v109, v110);
    v114 = objc_msgSend_numberWithInteger_(v111, v113, v112);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v115, (uint64_t)v114, @"blinkLeft");

    uint64_t v116 = NSNumber;
    uint64_t v119 = objc_msgSend_blinkRight(self->_eyeBlinkEstimate, v117, v118);
    v121 = objc_msgSend_numberWithInteger_(v116, v120, v119);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v122, (uint64_t)v121, @"blinkRight");
  }
  uint64_t v123 = objc_msgSend_numberWithBool_(NSNumber, v109, self->_eyeRectEstimateExists);
  objc_msgSend_setObject_forKeyedSubscript_(v6, v124, (uint64_t)v123, @"hasEyeData");

  if (self->_eyeRectEstimateExists)
  {
    uint64_t v127 = objc_msgSend_eyeRectLeft(self->_eyeRectEstimate, v125, v126);
    CGFloat v134 = sub_246D69BE8(v130, v131, v132, v133, v127, v128, v129);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v135, (uint64_t)v134, @"eyeRectLeft");

    uint64_t v138 = objc_msgSend_eyeRectRight(self->_eyeRectEstimate, v136, v137);
    CGFloat v145 = sub_246D69BE8(v141, v142, v143, v144, v138, v139, v140);
    objc_msgSend_setObject_forKeyedSubscript_(v6, v146, (uint64_t)v145, @"eyeRectRight");
  }
  v147 = objc_msgSend_copy(v6, v125, v126);

  return v147;
}

- (BOOL)isFrontal
{
  return self->_frontal;
}

- (int64_t)faceMaskConfidence
{
  return self->_faceMaskConfidence;
}

- (int64_t)eyeCoveringConfidence
{
  return self->_eyeCoveringConfidence;
}

- (ANST3DPoseEstimate)poseEstimate
{
  return self->_poseEstimate;
}

- (ANSTSkinToneEstimate)skinToneEstimate
{
  return self->_skinToneEstimate;
}

- (ANSTSmileEstimate)smileEstimate
{
  return self->_smileEstimate;
}

- (ANSTEyeBlinkEstimate)eyeBlinkEstimate
{
  return self->_eyeBlinkEstimate;
}

- (ANSTEyeRectEstimate)eyeRectEstimate
{
  return self->_eyeRectEstimate;
}

- (BOOL)poseEstimateExists
{
  return self->_poseEstimateExists;
}

- (BOOL)skinToneEstimateExists
{
  return self->_skinToneEstimateExists;
}

- (BOOL)smileEstimateExists
{
  return self->_smileEstimateExists;
}

- (BOOL)eyeBlinkEstimateExists
{
  return self->_eyeBlinkEstimateExists;
}

- (BOOL)eyeRectEstimateExists
{
  return self->_eyeRectEstimateExists;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eyeRectEstimate, 0);
  objc_storeStrong((id *)&self->_eyeBlinkEstimate, 0);
  objc_storeStrong((id *)&self->_smileEstimate, 0);
  objc_storeStrong((id *)&self->_skinToneEstimate, 0);
  objc_storeStrong((id *)&self->_poseEstimate, 0);
}

@end