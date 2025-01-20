@interface GDRankerItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isRelationshipMatch;
- (GDEntityFeatures)features;
- (GDEntityIdentifier)entityID;
- (GDEntitySourceID)sourceID;
- (GDRankerItem)initWithCoder:(id)a3;
- (GDRankerItem)initWithEntityID:(id)a3 score:(double)a4;
- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7;
- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11;
- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12;
- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12 isRelationshipMatch:(BOOL)a13;
- (NSNumber)entityRelevanceInferenceEventId;
- (NSString)entityClass;
- (double)confidence;
- (double)confirmationConfidence;
- (double)contextualScore;
- (double)entityRelevance;
- (double)nameScore;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDRankerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityRelevanceInferenceEventId, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_entityClass, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);

  objc_storeStrong((id *)&self->_entityID, 0);
}

- (BOOL)isRelationshipMatch
{
  return self->_isRelationshipMatch;
}

- (double)confirmationConfidence
{
  return self->_confirmationConfidence;
}

- (NSNumber)entityRelevanceInferenceEventId
{
  return self->_entityRelevanceInferenceEventId;
}

- (double)entityRelevance
{
  return self->_entityRelevance;
}

- (double)contextualScore
{
  return self->_contextualScore;
}

- (double)nameScore
{
  return self->_nameScore;
}

- (GDEntityFeatures)features
{
  return self->_features;
}

- (NSString)entityClass
{
  return self->_entityClass;
}

- (GDEntitySourceID)sourceID
{
  return self->_sourceID;
}

- (GDEntityIdentifier)entityID
{
  return self->_entityID;
}

- (double)score
{
  return self->_score;
}

- (double)confidence
{
  return self->_confidence;
}

- (id)description
{
  v6 = NSString;
  v7 = objc_msgSend_entityID(self, a2, v2, v3, v4);
  v12 = objc_msgSend_sourceID(self, v8, v9, v10, v11);
  objc_msgSend_score(self, v13, v14, v15, v16);
  uint64_t v18 = v17;
  v23 = objc_msgSend_entityClass(self, v19, v20, v21, v22);
  v28 = objc_msgSend_features(self, v24, v25, v26, v27);
  objc_msgSend_nameScore(self, v29, v30, v31, v32);
  uint64_t v34 = v33;
  objc_msgSend_contextualScore(self, v35, v36, v37, v38);
  uint64_t v40 = v39;
  objc_msgSend_entityRelevance(self, v41, v42, v43, v44);
  uint64_t v46 = v45;
  v51 = objc_msgSend_entityRelevanceInferenceEventId(self, v47, v48, v49, v50);
  objc_msgSend_confirmationConfidence(self, v52, v53, v54, v55);
  uint64_t v57 = v56;
  unsigned int isRelationshipMatch = objc_msgSend_isRelationshipMatch(self, v58, v59, v60, v61);
  v66 = objc_msgSend_stringWithFormat_(v6, v63, @"<GDRankerItem: entityID: %@, sourceID: %@, score: %f, entityClass: %@, features: %@, nameScore: %f, contextualScore: %f, entityRelevance: %f, entityRelevanceInferenceEventId: %@, confirmationConfidence: %f, isRelationshipMatch: %d>", v64, v65, v7, v12, v18, v23, v28, v34, v40, v46, v51, v57, isRelationshipMatch);

  return v66;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  uint64_t v9 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7, v8);
  entityID = self->_entityID;
  sourceID = self->_sourceID;
  entityClass = self->_entityClass;
  features = self->_features;
  double score = self->_score;
  double nameScore = self->_nameScore;
  double contextualScore = self->_contextualScore;
  double entityRelevance = self->_entityRelevance;
  entityRelevanceInferenceEventId = self->_entityRelevanceInferenceEventId;
  double confirmationConfidence = self->_confirmationConfidence;
  BOOL isRelationshipMatch = self->_isRelationshipMatch;

  return (id)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(v9, v10, (uint64_t)entityID, (uint64_t)sourceID, (uint64_t)entityClass, features, entityRelevanceInferenceEventId, isRelationshipMatch, score, nameScore, contextualScore, entityRelevance, confirmationConfidence);
}

- (GDRankerItem)initWithCoder:(id)a3
{
  v106[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_entityID);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = NSStringFromSelector(sel_sourceID);
    uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v14, (uint64_t)v15, v17);

    if (v18
      || (objc_msgSend_error(v4, v19, v20, v21, v22),
          v100 = objc_claimAutoreleasedReturnValue(),
          v100,
          !v100))
    {
      uint64_t v23 = objc_opt_class();
      v24 = NSStringFromSelector(sel_entityClass);
      uint64_t v27 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v25, v23, (uint64_t)v24, v26);

      if (v27
        || (objc_msgSend_error(v4, v28, v29, v30, v31),
            v101 = objc_claimAutoreleasedReturnValue(),
            v101,
            !v101))
      {
        uint64_t v32 = objc_opt_class();
        uint64_t v33 = NSStringFromSelector(sel_features);
        uint64_t v36 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v34, v32, (uint64_t)v33, v35);

        if (!v36)
        {
          v102 = objc_msgSend_error(v4, v37, v38, v39, v40);

          if (v102) {
            goto LABEL_16;
          }
        }
        v41 = NSStringFromSelector(sel_score);
        objc_msgSend_decodeDoubleForKey_(v4, v42, (uint64_t)v41, v43, v44);
        double v46 = v45;

        v47 = NSStringFromSelector(sel_nameScore);
        objc_msgSend_decodeDoubleForKey_(v4, v48, (uint64_t)v47, v49, v50);
        double v52 = v51;

        uint64_t v53 = NSStringFromSelector(sel_contextualScore);
        objc_msgSend_decodeDoubleForKey_(v4, v54, (uint64_t)v53, v55, v56);
        double v58 = v57;

        uint64_t v59 = NSStringFromSelector(sel_entityRelevance);
        objc_msgSend_decodeDoubleForKey_(v4, v60, (uint64_t)v59, v61, v62);
        double v64 = v63;

        uint64_t v65 = NSStringFromSelector(sel_confirmationConfidence);
        objc_msgSend_decodeDoubleForKey_(v4, v66, (uint64_t)v65, v67, v68);
        double v70 = v69;

        v71 = NSStringFromSelector(sel_isRelationshipMatch);
        uint64_t v75 = objc_msgSend_decodeBoolForKey_(v4, v72, (uint64_t)v71, v73, v74);

        v80 = objc_msgSend_error(v4, v76, v77, v78, v79);

        if (v80)
        {
LABEL_16:
          v90 = 0;
        }
        else
        {
          uint64_t v81 = objc_opt_class();
          v82 = NSStringFromSelector(sel_entityRelevanceInferenceEventId);
          v85 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v83, v81, (uint64_t)v82, v84);

          if (v85
            || (objc_msgSend_error(v4, v86, v87, v88, v89),
                v103 = objc_claimAutoreleasedReturnValue(),
                v103,
                !v103))
          {
            self = (GDRankerItem *)(id)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, v86, (uint64_t)v9, (uint64_t)v18, (uint64_t)v27, v36, v85, v75, v46, v52, v58, v64, v70);
            v90 = self;
          }
          else
          {
            v90 = 0;
          }
        }
      }
      else
      {
        v90 = 0;
      }
    }
    else
    {
      v90 = 0;
    }
  }
  else
  {
    v91 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v91)
    {
      v93 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v105 = *MEMORY[0x1E4F28568];
      v106[0] = @"GDRankerItem entityID is nil";
      v94 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v92, (uint64_t)v106, (uint64_t)&v105, 1);
      v96 = objc_msgSend_errorWithDomain_code_userInfo_(v93, v95, @"GDErrorDomain", 9, (uint64_t)v94);
      objc_msgSend_failWithError_(v4, v97, (uint64_t)v96, v98, v99);
    }
    v90 = 0;
  }

  return v90;
}

- (void)encodeWithCoder:(id)a3
{
  entityID = self->_entityID;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_entityID);
  objc_msgSend_encodeObject_forKey_(v5, v7, (uint64_t)entityID, (uint64_t)v6, v8);

  sourceID = self->_sourceID;
  uint64_t v10 = NSStringFromSelector(sel_sourceID);
  objc_msgSend_encodeObject_forKey_(v5, v11, (uint64_t)sourceID, (uint64_t)v10, v12);

  entityClass = self->_entityClass;
  uint64_t v14 = NSStringFromSelector(sel_entityClass);
  objc_msgSend_encodeObject_forKey_(v5, v15, (uint64_t)entityClass, (uint64_t)v14, v16);

  features = self->_features;
  uint64_t v18 = NSStringFromSelector(sel_features);
  objc_msgSend_encodeObject_forKey_(v5, v19, (uint64_t)features, (uint64_t)v18, v20);

  double score = self->_score;
  uint64_t v22 = NSStringFromSelector(sel_score);
  objc_msgSend_encodeDouble_forKey_(v5, v23, (uint64_t)v22, v24, v25, score);

  double nameScore = self->_nameScore;
  uint64_t v27 = NSStringFromSelector(sel_nameScore);
  objc_msgSend_encodeDouble_forKey_(v5, v28, (uint64_t)v27, v29, v30, nameScore);

  double contextualScore = self->_contextualScore;
  uint64_t v32 = NSStringFromSelector(sel_contextualScore);
  objc_msgSend_encodeDouble_forKey_(v5, v33, (uint64_t)v32, v34, v35, contextualScore);

  double entityRelevance = self->_entityRelevance;
  uint64_t v37 = NSStringFromSelector(sel_entityRelevance);
  objc_msgSend_encodeDouble_forKey_(v5, v38, (uint64_t)v37, v39, v40, entityRelevance);

  entityRelevanceInferenceEventId = self->_entityRelevanceInferenceEventId;
  uint64_t v42 = NSStringFromSelector(sel_entityRelevanceInferenceEventId);
  objc_msgSend_encodeObject_forKey_(v5, v43, (uint64_t)entityRelevanceInferenceEventId, (uint64_t)v42, v44);

  double confirmationConfidence = self->_confirmationConfidence;
  double v46 = NSStringFromSelector(sel_confirmationConfidence);
  objc_msgSend_encodeDouble_forKey_(v5, v47, (uint64_t)v46, v48, v49, confirmationConfidence);

  BOOL isRelationshipMatch = self->_isRelationshipMatch;
  NSStringFromSelector(sel_isRelationshipMatch);
  id v53 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeBool_forKey_(v5, v51, isRelationshipMatch, (uint64_t)v53, v52);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12 isRelationshipMatch:(BOOL)a13
{
  id v24 = a3;
  id v25 = a4;
  id v26 = a5;
  id v27 = a6;
  id v28 = a11;
  v56.receiver = self;
  v56.super_class = (Class)GDRankerItem;
  uint64_t v33 = [(GDRankerItem *)&v56 init];
  if (v33)
  {
    uint64_t v34 = objc_msgSend_copy(v24, v29, v30, v31, v32);
    entityID = v33->_entityID;
    v33->_entityID = (GDEntityIdentifier *)v34;

    uint64_t v40 = objc_msgSend_copy(v25, v36, v37, v38, v39);
    sourceID = v33->_sourceID;
    v33->_sourceID = (GDEntitySourceID *)v40;

    uint64_t v46 = objc_msgSend_copy(v26, v42, v43, v44, v45);
    entityClass = v33->_entityClass;
    v33->_entityClass = (NSString *)v46;

    uint64_t v52 = objc_msgSend_copy(v27, v48, v49, v50, v51);
    features = v33->_features;
    v33->_features = (GDEntityFeatures *)v52;

    v33->_confidence = a7;
    v33->_double score = a7;
    v33->_double nameScore = a8;
    v33->_double contextualScore = a9;
    v33->_double entityRelevance = a10;
    if (v28) {
      uint64_t v54 = v28;
    }
    else {
      uint64_t v54 = &unk_1F0B10598;
    }
    objc_storeStrong((id *)&v33->_entityRelevanceInferenceEventId, v54);
    v33->_double confirmationConfidence = a12;
    v33->_BOOL isRelationshipMatch = a13;
  }

  return v33;
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11 confirmationConfidence:(double)a12
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a11, 0, a7, a8, a9, a10, 0.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7 nameScore:(double)a8 contextualScore:(double)a9 entityRelevance:(double)a10 entityRelevanceInferenceEventId:(id)a11
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a11, 0, a7, a8, a9, a10, 1.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 sourceID:(id)a4 entityClass:(id)a5 features:(id)a6 score:(double)a7
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, &unk_1F0B10598, 0, a7, 0.0, 0.0, 0.0, 1.0);
}

- (GDRankerItem)initWithEntityID:(id)a3 score:(double)a4
{
  return (GDRankerItem *)objc_msgSend_initWithEntityID_sourceID_entityClass_features_score_nameScore_contextualScore_entityRelevance_entityRelevanceInferenceEventId_confirmationConfidence_isRelationshipMatch_(self, a2, (uint64_t)a3, 0, 0, 0, &unk_1F0B10598, 0, a4, 0.0, 0.0, 0.0, 1.0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end