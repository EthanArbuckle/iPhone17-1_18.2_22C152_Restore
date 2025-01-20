@interface CHStrokeGroup
+ (BOOL)isStrokeGroupSet:(id)a3 equivalentToStrokeGroupSet:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)strokeGroupClosestToPoint:(CGPoint)a3 strokeGroups:(id)a4;
+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4;
+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4 foundStrokeGroupIndex:(int64_t *)a5;
+ (id)strokeGroupsClusteredByProximity:(id)a3;
+ (id)strokeIdentifierToGroupIndexMappingForStrokeIdentifiers:(id)a3 orderedStrokeGroups:(id)a4;
+ (void)strokeGroupsContainingPoint:(CGPoint)a3 strokeGroups:(id)a4 groupProcessingBlock:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToStrokeGroup:(id)a3;
- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4;
- (CGPoint)firstStrokeOrigin;
- (CGRect)bounds;
- (CGSize)normalizedSize;
- (CGVector)averageWritingOrientation;
- (CHEncodedStrokeIdentifier)firstStrokeIdentifier;
- (CHEncodedStrokeIdentifier)lastStrokeIdentifier;
- (CHStrokeGroup)init;
- (CHStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 strategyIdentifier:(id)a10 firstStrokeOrigin:(CGPoint)a11;
- (CHStrokeGroup)initWithCoder:(id)a3;
- (CHStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 groupingConfidence:(double)a8 strategyIdentifier:(id)a9 firstStrokeOrigin:(CGPoint)a10;
- (CHStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 groupingConfidence:(double)a10 strategyIdentifier:(id)a11 firstStrokeOrigin:(CGPoint)a12;
- (CHStrokeGroup)strokeGroupWithUpdatedStrategyIdentifier:(id)a3 classification:(int64_t)a4;
- (CRNormalizedQuad)boundingQuad;
- (NSSet)strokeIdentifiers;
- (NSString)description;
- (NSString)strategyIdentifier;
- (double)groupingConfidence;
- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 firstStrokeOrigin:(CGPoint)a10;
- (int64_t)ancestorIdentifier;
- (int64_t)classification;
- (int64_t)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)layoutDirection;
- (void)encodeWithCoder:(id)a3;
- (void)setNormalizedSize:(CGSize)a3;
@end

@implementation CHStrokeGroup

- (CHStrokeGroup)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroup)initWithStrokeIdentifiers:(id)a3 firstStrokeIdentifier:(id)a4 lastStrokeIdentifier:(id)a5 bounds:(CGRect)a6 classification:(int64_t)a7 groupingConfidence:(double)a8 strategyIdentifier:(id)a9 firstStrokeOrigin:(CGPoint)a10
{
  return (CHStrokeGroup *)objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, a2, 0x7FFFFFFFFFFFFFFFLL, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a7, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a8, a10.x, a10.y);
}

- (CHStrokeGroup)initWithAncestorIdentifier:(int64_t)a3 strokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 strategyIdentifier:(id)a10 firstStrokeOrigin:(CGPoint)a11
{
  double y = a11.y;
  double x = a11.x;
  double height = a7.size.height;
  double width = a7.size.width;
  double v18 = a7.origin.y;
  double v19 = a7.origin.x;
  id v24 = a4;
  id v25 = a5;
  id v26 = a6;
  id v27 = a10;
  self;
  if (qword_1EA3C91A0 != -1) {
    dispatch_once(&qword_1EA3C91A0, &unk_1F2012BD0);
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1C4A1B6A0;
  block[3] = &unk_1E64E1A88;
  block[4] = &v34;
  dispatch_sync((dispatch_queue_t)qword_1EA3C9198, block);
  uint64_t v28 = v35[3];
  _Block_object_dispose(&v34, 8);
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v29, v28, v28, (uint64_t)v24, (uint64_t)v25, v26, a8, v19, v18, width, height, a9, x, y, v27);
  }
  else {
    uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v29, v28, a3, (uint64_t)v24, (uint64_t)v25, v26, a8, v19, v18, width, height, a9, x, y, v27);
  }
  v31 = (CHStrokeGroup *)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;

  return v31;
}

- (CHStrokeGroup)initWithUniqueIdentifier:(int64_t)a3 ancestorIdentifier:(int64_t)a4 strokeIdentifiers:(id)a5 firstStrokeIdentifier:(id)a6 lastStrokeIdentifier:(id)a7 bounds:(CGRect)a8 classification:(int64_t)a9 groupingConfidence:(double)a10 strategyIdentifier:(id)a11 firstStrokeOrigin:(CGPoint)a12
{
  CGFloat y = a12.y;
  CGFloat x = a12.x;
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat v20 = a8.origin.y;
  CGFloat v21 = a8.origin.x;
  id v24 = a5;
  id v39 = a6;
  id v25 = a7;
  id v26 = a11;
  v40.receiver = self;
  v40.super_class = (Class)CHStrokeGroup;
  id v27 = [(CHStrokeGroup *)&v40 init];
  v33 = v27;
  if (v27)
  {
    v27->_uniqueIdentifier = a3;
    v27->_ancestorIdentifier = a4;
    uint64_t v34 = objc_msgSend_copy(v24, v28, v29, v30, v31, v32);
    strokeIdentifiers = v33->_strokeIdentifiers;
    v33->_strokeIdentifiers = (NSSet *)v34;

    objc_storeStrong((id *)&v33->_firstStrokeIdentifier, a6);
    objc_storeStrong((id *)&v33->_lastStrokeIdentifier, a7);
    v33->_bounds.origin.CGFloat x = v21;
    v33->_bounds.origin.CGFloat y = v20;
    uint64_t v36 = (CGSize *)MEMORY[0x1E4F1DB30];
    v33->_bounds.size.CGFloat width = width;
    v33->_bounds.size.CGFloat height = height;
    v33->_normalizedSize = *v36;
    v33->_classification = a9;
    v33->_groupingConfidence = a10;
    objc_storeStrong((id *)&v33->_strategyIdentifier, a11);
    v33->_firstStrokeOrigin.CGFloat x = x;
    v33->_firstStrokeOrigin.CGFloat y = y;
  }

  return v33;
}

- (CHStrokeGroup)strokeGroupWithUpdatedStrategyIdentifier:(id)a3 classification:(int64_t)a4
{
  id v6 = a3;
  v7 = [CHStrokeGroup alloc];
  uint64_t v13 = objc_msgSend_uniqueIdentifier(self, v8, v9, v10, v11, v12);
  uint64_t v19 = objc_msgSend_ancestorIdentifier(self, v14, v15, v16, v17, v18);
  id v25 = objc_msgSend_strokeIdentifiers(self, v20, v21, v22, v23, v24);
  uint64_t v31 = objc_msgSend_firstStrokeIdentifier(self, v26, v27, v28, v29, v30);
  uint64_t v37 = objc_msgSend_lastStrokeIdentifier(self, v32, v33, v34, v35, v36);
  objc_msgSend_bounds(self, v38, v39, v40, v41, v42);
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  double v50 = v49;
  objc_msgSend_groupingConfidence(self, v51, v52, v53, v54, v55);
  double v57 = v56;
  objc_msgSend_firstStrokeOrigin(self, v58, v59, v60, v61, v62);
  uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v7, v63, v13, v19, (uint64_t)v25, (uint64_t)v31, v37, a4, v44, v46, v48, v50, v57, v64, v65, v6);

  return (CHStrokeGroup *)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

+ (BOOL)isStrokeGroupSet:(id)a3 equivalentToStrokeGroupSet:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  double v46 = v5;
  double v47 = v6;
  if (v5 == v6)
  {
    BOOL v44 = 1;
  }
  else
  {
    uint64_t v12 = v6;
    uint64_t v13 = objc_msgSend_count(v5, v7, v8, v9, v10, v11);
    if (v13 == objc_msgSend_count(v12, v14, v15, v16, v17, v18))
    {
      uint64_t v24 = objc_msgSend_mutableCopy(v12, v19, v20, v21, v22, v23);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id obj = v5;
      uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v53, (uint64_t)v58, 16, v26);
      if (v27)
      {
        uint64_t v28 = *(void *)v54;
        while (1)
        {
          uint64_t v29 = 0;
LABEL_6:
          if (*(void *)v54 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = *(void **)(*((void *)&v53 + 1) + 8 * v29);
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v31 = v24;
          uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v49, (uint64_t)v57, 16, v33);
          if (!v38) {
            break;
          }
          uint64_t v39 = *(void *)v50;
LABEL_10:
          uint64_t v40 = 0;
          while (1)
          {
            if (*(void *)v50 != v39) {
              objc_enumerationMutation(v31);
            }
            uint64_t v41 = *(void *)(*((void *)&v49 + 1) + 8 * v40);
            if (objc_msgSend_isEquivalentToStrokeGroup_(v30, v34, v41, v35, v36, v37)) {
              break;
            }
            if (v38 == ++v40)
            {
              uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v49, (uint64_t)v57, 16, v37);
              if (v38) {
                goto LABEL_10;
              }
              goto LABEL_22;
            }
          }
          objc_msgSend_removeObject_(v31, v34, v41, v35, v36, v37);

          if (++v29 != v27) {
            goto LABEL_6;
          }
          uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v42, (uint64_t)&v53, (uint64_t)v58, 16, v43);
          BOOL v44 = 1;
          if (!v27) {
            goto LABEL_24;
          }
        }
LABEL_22:

        BOOL v44 = 0;
      }
      else
      {
        BOOL v44 = 1;
      }
LABEL_24:
    }
    else
    {
      BOOL v44 = 0;
    }
  }

  return v44;
}

- (NSString)description
{
  v74.receiver = self;
  v74.super_class = (Class)CHStrokeGroup;
  v3 = [(CHStrokeGroup *)&v74 description];
  uint64_t v9 = objc_msgSend_uniqueIdentifier(self, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_ancestorIdentifier(self, v10, v11, v12, v13, v14);
  objc_msgSend_bounds(self, v16, v17, v18, v19, v20);
  uint64_t v22 = v21;
  objc_msgSend_bounds(self, v23, v24, v25, v26, v27);
  uint64_t v29 = v28;
  objc_msgSend_bounds(self, v30, v31, v32, v33, v34);
  uint64_t v36 = v35;
  objc_msgSend_bounds(self, v37, v38, v39, v40, v41);
  uint64_t v43 = v42;
  long long v49 = objc_msgSend_strokeIdentifiers(self, v44, v45, v46, v47, v48);
  uint64_t v55 = objc_msgSend_count(v49, v50, v51, v52, v53, v54);
  uint64_t v61 = objc_msgSend_strategyIdentifier(self, v56, v57, v58, v59, v60);
  uint64_t v67 = objc_msgSend_classification(self, v62, v63, v64, v65, v66);
  v72 = objc_msgSend_stringByAppendingFormat_(v3, v68, @" uniqueID: %ld, ancestorID: %ld, bounds: {x: %0.1f, y: %0.1f, width: %0.1f, height: %0.1f}, strokes: %ld, strategy: %@, classification = %ld", v69, v70, v71, v9, v15, v22, v29, v36, v43, v55, v61, v67);

  return (NSString *)v72;
}

- (CGVector)averageWritingOrientation
{
  double v2 = 1.0;
  double v3 = 0.0;
  result.dCGFloat y = v3;
  result.dCGFloat x = v2;
  return result;
}

- (CGSize)normalizedSize
{
  double width = self->_normalizedSize.width;
  double height = self->_normalizedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNormalizedSize:(CGSize)a3
{
  self->_normalizedSize = a3;
}

- (id)groupByAddingStrokeIdentifiers:(id)a3 removingStrokeIdentifiers:(id)a4 firstStrokeIdentifier:(id)a5 lastStrokeIdentifier:(id)a6 bounds:(CGRect)a7 classification:(int64_t)a8 groupingConfidence:(double)a9 firstStrokeOrigin:(CGPoint)a10
{
  double y = a10.y;
  double x = a10.x;
  double height = a7.size.height;
  double width = a7.size.width;
  double v16 = a7.origin.y;
  double v17 = a7.origin.x;
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  uint64_t v36 = objc_msgSend_strokeIdentifiers(self, v26, v27, v28, v29, v30);
  if (!v36)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v37 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)uint64_t v70 = 0;
      _os_log_impl(&dword_1C492D000, v37, OS_LOG_TYPE_FAULT, "Cannot have nil strokeIdentifiers", v70, 2u);
    }
  }
  if (objc_msgSend_count(v22, v31, v32, v33, v34, v35))
  {
    uint64_t v43 = objc_msgSend_setByAddingObjectsFromSet_(v36, v38, (uint64_t)v22, v40, v41, v42);

    uint64_t v36 = (void *)v43;
  }
  if (objc_msgSend_count(v23, v38, v39, v40, v41, v42))
  {
    long long v49 = objc_msgSend_mutableCopy(v36, v44, v45, v46, v47, v48);
    objc_msgSend_minusSet_(v49, v50, (uint64_t)v23, v51, v52, v53);
  }
  else
  {
    long long v49 = v36;
  }
  id v54 = objc_alloc((Class)objc_opt_class());
  uint64_t v60 = objc_msgSend_ancestorIdentifier(self, v55, v56, v57, v58, v59);
  uint64_t v66 = objc_msgSend_strategyIdentifier(self, v61, v62, v63, v64, v65);
  uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = objc_msgSend_initWithAncestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v54, v67, v60, (uint64_t)v49, (uint64_t)v24, (uint64_t)v25, a8, v66, v17, v16, width, height, a9, x, y);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

- (CGPath)newEstimatedBaselineForStrokesWithTokens:(id)a3 tokenStrokeIdentifiers:(id)a4
{
  Mutable = CGPathCreateMutable();
  objc_msgSend_bounds(self, v6, v7, v8, v9, v10);
  CGFloat MinX = CGRectGetMinX(v31);
  objc_msgSend_bounds(self, v12, v13, v14, v15, v16);
  CGFloat MaxY = CGRectGetMaxY(v32);
  CGPathMoveToPoint(Mutable, 0, MinX, MaxY);
  objc_msgSend_bounds(self, v18, v19, v20, v21, v22);
  CGFloat MaxX = CGRectGetMaxX(v33);
  objc_msgSend_bounds(self, v24, v25, v26, v27, v28);
  CGFloat v29 = CGRectGetMaxY(v34);
  CGPathAddLineToPoint(Mutable, 0, MaxX, v29);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)encodeWithCoder:(id)a3
{
  id v43 = a3;
  objc_msgSend_encodeInteger_forKey_(v43, v4, self->_ancestorIdentifier, @"ancestorIdentifier", v5, v6);
  objc_msgSend_encodeInteger_forKey_(v43, v7, self->_uniqueIdentifier, @"uniqueIdentifier", v8, v9);
  objc_msgSend_encodeObject_forKey_(v43, v10, (uint64_t)self->_strokeIdentifiers, @"strokeIdentifiers", v11, v12);
  objc_msgSend_encodeObject_forKey_(v43, v13, (uint64_t)self->_firstStrokeIdentifier, @"firstStrokeIdentifier", v14, v15);
  objc_msgSend_encodeObject_forKey_(v43, v16, (uint64_t)self->_lastStrokeIdentifier, @"lastStrokeIdentifier", v17, v18);
  uint64_t v22 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v19, (uint64_t)&self->_bounds, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v20, v21);
  objc_msgSend_encodeObject_forKey_(v43, v23, (uint64_t)v22, @"bounds", v24, v25);
  objc_msgSend_encodeInteger_forKey_(v43, v26, self->_classification, @"classification", v27, v28);
  objc_msgSend_encodeDouble_forKey_(v43, v29, @"groupingConfidence", v30, v31, v32, self->_groupingConfidence);
  objc_msgSend_encodeObject_forKey_(v43, v33, (uint64_t)self->_strategyIdentifier, @"strategyIdentifier", v34, v35);
  uint64_t v39 = objc_msgSend_valueWithBytes_objCType_(MEMORY[0x1E4F29238], v36, (uint64_t)&self->_firstStrokeOrigin, (uint64_t)"{CGPoint=dd}", v37, v38);
  objc_msgSend_encodeObject_forKey_(v43, v40, (uint64_t)v39, @"firstStrokeOrigin", v41, v42);
}

- (CHStrokeGroup)initWithCoder:(id)a3
{
  v78[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = objc_msgSend_decodeIntegerForKey_(v3, v4, @"ancestorIdentifier", v5, v6, v7);
  uint64_t v13 = objc_msgSend_decodeIntegerForKey_(v3, v9, @"uniqueIdentifier", v10, v11, v12);
  uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
  v78[0] = objc_opt_class();
  v78[1] = objc_opt_class();
  uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v15, (uint64_t)v78, 2, v16, v17);
  id v23 = objc_msgSend_setWithArray_(v14, v19, (uint64_t)v18, v20, v21, v22);
  uint64_t v27 = objc_msgSend_decodeObjectOfClasses_forKey_(v3, v24, (uint64_t)v23, @"strokeIdentifiers", v25, v26);

  uint64_t v28 = objc_opt_class();
  uint64_t v32 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v29, v28, @"firstStrokeIdentifier", v30, v31);
  uint64_t v33 = objc_opt_class();
  uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v34, v33, @"lastStrokeIdentifier", v35, v36);
  uint64_t v38 = objc_opt_class();
  uint64_t v42 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v39, v38, @"bounds", v40, v41);
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v76 = *MEMORY[0x1E4F1DB20];
  long long v77 = v43;
  objc_msgSend_getValue_size_(v42, v44, (uint64_t)&v76, 32, v45, v46);
  uint64_t v51 = objc_msgSend_decodeIntegerForKey_(v3, v47, @"classification", v48, v49, v50);
  objc_msgSend_decodeDoubleForKey_(v3, v52, @"groupingConfidence", v53, v54, v55);
  double v57 = v56;
  uint64_t v58 = objc_opt_class();
  uint64_t v62 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v59, v58, @"strategyIdentifier", v60, v61);
  uint64_t v63 = objc_opt_class();
  uint64_t v67 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v64, v63, @"firstStrokeOrigin", v65, v66);
  objc_msgSend_getValue_size_(v67, v68, (uint64_t)v75, 16, v69, v70);
  uint64_t StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (CHStrokeGroup *)objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(self, v71, v13, v8, (uint64_t)v27, (uint64_t)v32, v37, v51, v76, v77, v57, v75[0], v75[1], v62, 0);

  return StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (CHStrokeGroup *)v4;
    uint64_t v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        int64_t ancestorIdentifier = self->_ancestorIdentifier;
        if (ancestorIdentifier != objc_msgSend_ancestorIdentifier(v5, v6, v7, v8, v9, v10)) {
          goto LABEL_25;
        }
        int64_t uniqueIdentifier = self->_uniqueIdentifier;
        if (uniqueIdentifier != objc_msgSend_uniqueIdentifier(v11, v13, v14, v15, v16, v17)) {
          goto LABEL_25;
        }
        strokeIdentifiers = self->_strokeIdentifiers;
        objc_msgSend_strokeIdentifiers(v11, v19, v20, v21, v22, v23);
        uint64_t v30 = (NSSet *)objc_claimAutoreleasedReturnValue();
        if (strokeIdentifiers == v30)
        {
        }
        else
        {
          uint64_t v31 = objc_msgSend_strokeIdentifiers(v11, v25, v26, v27, v28, v29);
          int isEqual = objc_msgSend_isEqual_(v31, v32, (uint64_t)self->_strokeIdentifiers, v33, v34, v35);

          if (!isEqual) {
            goto LABEL_25;
          }
        }
        firstStrokeIdentifier = self->_firstStrokeIdentifier;
        objc_msgSend_firstStrokeIdentifier(v11, v37, v38, v39, v40, v41);
        uint64_t v48 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (firstStrokeIdentifier == v48)
        {
        }
        else
        {
          uint64_t v49 = objc_msgSend_firstStrokeIdentifier(v11, v43, v44, v45, v46, v47);
          int v54 = objc_msgSend_isEqual_(v49, v50, (uint64_t)self->_firstStrokeIdentifier, v51, v52, v53);

          if (!v54) {
            goto LABEL_25;
          }
        }
        lastStrokeIdentifier = self->_lastStrokeIdentifier;
        objc_msgSend_lastStrokeIdentifier(v11, v55, v56, v57, v58, v59);
        uint64_t v66 = (CHEncodedStrokeIdentifier *)objc_claimAutoreleasedReturnValue();
        if (lastStrokeIdentifier == v66)
        {

LABEL_20:
          CGFloat x = self->_bounds.origin.x;
          CGFloat y = self->_bounds.origin.y;
          CGFloat width = self->_bounds.size.width;
          CGFloat height = self->_bounds.size.height;
          objc_msgSend_bounds(v11, v73, v74, v75, v76, v77);
          v128.origin.CGFloat x = v82;
          v128.origin.CGFloat y = v83;
          v128.size.CGFloat width = v84;
          v128.size.CGFloat height = v85;
          v127.origin.CGFloat x = x;
          v127.origin.CGFloat y = y;
          v127.size.CGFloat width = width;
          v127.size.CGFloat height = height;
          if (!CGRectEqualToRect(v127, v128)) {
            goto LABEL_25;
          }
          int64_t classification = self->_classification;
          if (classification != objc_msgSend_classification(v11, v86, v87, v88, v89, v90)) {
            goto LABEL_25;
          }
          double groupingConfidence = self->_groupingConfidence;
          objc_msgSend_groupingConfidence(v11, v92, v93, v94, v95, v96);
          if (groupingConfidence != v103) {
            goto LABEL_25;
          }
          strategyIdentifier = self->_strategyIdentifier;
          objc_msgSend_strategyIdentifier(v11, v98, v99, v100, v101, v102);
          v110 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (strategyIdentifier == v110)
          {
          }
          else
          {
            v111 = objc_msgSend_strategyIdentifier(v11, v105, v106, v107, v108, v109);
            int v116 = objc_msgSend_isEqual_(v111, v112, (uint64_t)self->_strategyIdentifier, v113, v114, v115);

            if (!v116) {
              goto LABEL_25;
            }
          }
          double v124 = self->_firstStrokeOrigin.x;
          double v123 = self->_firstStrokeOrigin.y;
          objc_msgSend_firstStrokeOrigin(v11, v117, v118, v119, v120, v121);
          LOBYTE(self) = v123 == v126 && v124 == v125;
          goto LABEL_26;
        }
        uint64_t v67 = objc_msgSend_lastStrokeIdentifier(v11, v61, v62, v63, v64, v65);
        int v72 = objc_msgSend_isEqual_(v67, v68, (uint64_t)self->_lastStrokeIdentifier, v69, v70, v71);

        if (v72) {
          goto LABEL_20;
        }
LABEL_25:
        LOBYTE(self) = 0;
        goto LABEL_26;
      }
      LOBYTE(self) = 1;
    }
LABEL_26:

    goto LABEL_27;
  }
  LOBYTE(self) = 0;
LABEL_27:

  return (char)self;
}

- (unint64_t)hash
{
  uint64_t v7 = objc_msgSend_hash(self->_strokeIdentifiers, a2, v2, v3, v4, v5);
  uint64_t v13 = objc_msgSend_numberWithDouble_(NSNumber, v8, v9, v10, v11, v12, self->_bounds.origin.x);
  uint64_t v19 = objc_msgSend_hash(v13, v14, v15, v16, v17, v18);
  uint64_t v25 = objc_msgSend_numberWithDouble_(NSNumber, v20, v21, v22, v23, v24, self->_bounds.origin.y);
  uint64_t v31 = objc_msgSend_hash(v25, v26, v27, v28, v29, v30);
  uint64_t v37 = objc_msgSend_numberWithDouble_(NSNumber, v32, v33, v34, v35, v36, self->_bounds.size.width);
  uint64_t v43 = objc_msgSend_hash(v37, v38, v39, v40, v41, v42);
  uint64_t v49 = objc_msgSend_numberWithDouble_(NSNumber, v44, v45, v46, v47, v48, self->_bounds.size.height);
  uint64_t v114 = objc_msgSend_hash(v49, v50, v51, v52, v53, v54);

  uint64_t v60 = objc_msgSend_numberWithDouble_(NSNumber, v55, v56, v57, v58, v59, self->_firstStrokeOrigin.x);
  uint64_t v113 = objc_msgSend_hash(v60, v61, v62, v63, v64, v65);
  uint64_t v71 = objc_msgSend_numberWithDouble_(NSNumber, v66, v67, v68, v69, v70, self->_firstStrokeOrigin.y);
  uint64_t v112 = v43;
  uint64_t v72 = v31;
  uint64_t v73 = v19;
  uint64_t v74 = v7;
  uint64_t v80 = objc_msgSend_hash(v71, v75, v76, v77, v78, v79);

  uint64_t v86 = objc_msgSend_hash(self->_firstStrokeIdentifier, v81, v82, v83, v84, v85);
  uint64_t v92 = objc_msgSend_hash(self->_firstStrokeIdentifier, v87, v88, v89, v90, v91);
  uint64_t v98 = objc_msgSend_hash(self->_strategyIdentifier, v93, v94, v95, v96, v97);
  v104 = objc_msgSend_numberWithDouble_(NSNumber, v99, v100, v101, v102, v103, self->_groupingConfidence);
  uint64_t v110 = objc_msgSend_hash(v104, v105, v106, v107, v108, v109);

  return v73 ^ v74 ^ v72 ^ v112 ^ v114 ^ v113 ^ v80 ^ v86 ^ v92 ^ v98 ^ v110 ^ self->_ancestorIdentifier ^ self->_uniqueIdentifier ^ self->_classification;
}

- (BOOL)isEquivalentToStrokeGroup:(id)a3
{
  uint64_t v9 = (CHStrokeGroup *)a3;
  if (self == v9)
  {
    char isEqualToSet = 1;
  }
  else
  {
    uint64_t v10 = objc_msgSend_strokeIdentifiers(self, v4, v5, v6, v7, v8);
    uint64_t v16 = objc_msgSend_count(v10, v11, v12, v13, v14, v15);
    uint64_t v22 = objc_msgSend_strokeIdentifiers(v9, v17, v18, v19, v20, v21);
    uint64_t v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);

    if (v16 != v28) {
      goto LABEL_6;
    }
    objc_msgSend_bounds(self, v29, v30, v31, v32, v33);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    objc_msgSend_bounds(v9, v42, v43, v44, v45, v46);
    v87.origin.CGFloat x = v47;
    v87.origin.CGFloat y = v48;
    v87.size.CGFloat width = v49;
    v87.size.CGFloat height = v50;
    v86.origin.CGFloat x = v35;
    v86.origin.CGFloat y = v37;
    v86.size.CGFloat width = v39;
    v86.size.CGFloat height = v41;
    if (!CGRectEqualToRect(v86, v87)) {
      goto LABEL_6;
    }
    uint64_t v56 = objc_msgSend_strategyIdentifier(self, v51, v52, v53, v54, v55);
    uint64_t v62 = objc_msgSend_strategyIdentifier(v9, v57, v58, v59, v60, v61);
    char isEqualToString = objc_msgSend_isEqualToString_(v56, v63, (uint64_t)v62, v64, v65, v66);

    if (isEqualToString)
    {
      uint64_t v73 = objc_msgSend_strokeIdentifiers(self, v68, v69, v70, v71, v72);
      uint64_t v79 = objc_msgSend_strokeIdentifiers(v9, v74, v75, v76, v77, v78);
      char isEqualToSet = objc_msgSend_isEqualToSet_(v73, v80, (uint64_t)v79, v81, v82, v83);
    }
    else
    {
LABEL_6:
      char isEqualToSet = 0;
    }
  }

  return isEqualToSet;
}

+ (id)strokeGroupsClusteredByProximity:(id)a3
{
  uint64_t v289 = *MEMORY[0x1E4F143B8];
  id v267 = a3;
  objc_msgSend_array(MEMORY[0x1E4F1CA48], v3, v4, v5, v6, v7);
  id v269 = (id)objc_claimAutoreleasedReturnValue();
  v273 = objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v8, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_count(v267, v13, v14, v15, v16, v17);
  id v19 = v267;
  self;
  __p = 0;
  uint64_t v284 = 0;
  v285 = 0;
  long long v279 = 0u;
  long long v280 = 0u;
  long long v281 = 0u;
  long long v282 = 0u;
  id rect_24 = v19;
  uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(rect_24, v20, (uint64_t)&v279, (uint64_t)&v286, 16, v21);
  uint64_t v268 = v18;
  if (!v27)
  {
    uint64_t v30 = 0;
    double v32 = 0.0;
    goto LABEL_41;
  }
  uint64_t v28 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = *(void *)v280;
  double v32 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v27; ++i)
    {
      while (1)
      {
        if (*(void *)v280 != v31) {
          objc_enumerationMutation(rect_24);
        }
        double v34 = *(void **)(*((void *)&v279 + 1) + 8 * i);
        objc_msgSend_normalizedSize(v34, v22, v23, v24, v25, v26);
        double v36 = v35;
        if (v35 == 0.0)
        {
          objc_msgSend_bounds(v34, v22, v23, v24, v25, v26);
          double v36 = v37;
        }
        if (v30 >= v29) {
          break;
        }
        *v30++ = v36;
        uint64_t v284 = (uint64_t)v30;
        double v32 = v32 + v36;
        if (++i == v27) {
          goto LABEL_38;
        }
      }
      uint64_t v38 = v30 - v28;
      unint64_t v39 = v38 + 1;
      if ((unint64_t)(v38 + 1) >> 61) {
        sub_1C494A220();
      }
      if (((char *)v29 - (char *)v28) >> 2 > v39) {
        unint64_t v39 = ((char *)v29 - (char *)v28) >> 2;
      }
      if ((unint64_t)((char *)v29 - (char *)v28) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v40 = v39;
      }
      if (v40)
      {
        if (v40 >> 61) {
          sub_1C4949AA8();
        }
        CGFloat v41 = operator new(8 * v40);
        uint64_t v42 = (double *)&v41[8 * v38];
        *uint64_t v42 = v36;
        uint64_t v43 = (uint64_t)(v42 + 1);
        int64_t v44 = (char *)v30 - (char *)v28;
        if (v30 == v28) {
          goto LABEL_24;
        }
      }
      else
      {
        CGFloat v41 = 0;
        uint64_t v42 = (double *)(8 * v38);
        *(double *)(8 * v38) = v36;
        uint64_t v43 = 8 * v38 + 8;
        int64_t v44 = (char *)v30 - (char *)v28;
        if (v30 == v28) {
          goto LABEL_24;
        }
      }
      unint64_t v45 = v44 - 8;
      if (v45 < 0x168)
      {
        uint64_t v46 = v30;
        goto LABEL_23;
      }
      unint64_t v48 = ((char *)(v30 - 1) - (char *)v28) & 0xFFFFFFFFFFFFFFF8;
      if (&v41[(char *)v30 - (char *)v28 - 8 - v48] > &v41[(char *)v30 - (char *)v28 - 8])
      {
        uint64_t v46 = v30;
        do
        {
LABEL_23:
          uint64_t v47 = *((void *)v46-- - 1);
          *((void *)v42-- - 1) = v47;
        }
        while (v46 != v28);
        goto LABEL_24;
      }
      if ((double *)((char *)v30 - v48 - 8) > v30 - 1)
      {
        uint64_t v46 = v30;
        goto LABEL_23;
      }
      if ((unint64_t)((char *)v28 - v41) < 0x20)
      {
        uint64_t v46 = v30;
        goto LABEL_23;
      }
      uint64_t v49 = (v45 >> 3) + 1;
      uint64_t v50 = 8 * (v49 & 0x3FFFFFFFFFFFFFFCLL);
      uint64_t v46 = &v30[v50 / 0xFFFFFFFFFFFFFFF8];
      uint64_t v42 = (double *)((char *)v42 - v50);
      uint64_t v51 = &v41[8 * v38 - 16];
      uint64_t v52 = v30 - 2;
      uint64_t v53 = v49 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v54 = *(_OWORD *)v52;
        *(v51 - 1) = *((_OWORD *)v52 - 1);
        _OWORD *v51 = v54;
        v51 -= 2;
        v52 -= 4;
        v53 -= 4;
      }
      while (v53);
      if (v49 != (v49 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_23;
      }
LABEL_24:
      uint64_t v29 = (double *)&v41[8 * v40];
      __p = v42;
      uint64_t v284 = v43;
      v285 = v29;
      if (v28) {
        operator delete(v28);
      }
      uint64_t v28 = v42;
      uint64_t v30 = (double *)v43;
      uint64_t v284 = v43;
      double v32 = v32 + v36;
    }
LABEL_38:
    uint64_t v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(rect_24, v22, (uint64_t)&v279, (uint64_t)&v286, 16, v26);
  }
  while (v27);
LABEL_41:

  uint64_t v55 = v18;
  double v66 = 0.0;
  double rect = 0.0;
  if (objc_msgSend_count(rect_24, v56, v57, v58, v59, v60)) {
    double rect = v32 / (double)(unint64_t)objc_msgSend_count(rect_24, v61, v62, v63, v64, v65);
  }
  uint64_t v67 = (char *)v30 - (unsigned char *)__p;
  if (v30 != __p)
  {
    uint64_t v68 = v67 >> 3;
    unint64_t v69 = v67 - 8;
    double v70 = 0.0;
    uint64_t v71 = (double *)__p;
    if (v69 < 0x18) {
      goto LABEL_133;
    }
    uint64_t v72 = (v69 >> 3) + 1;
    uint64_t v71 = (double *)((char *)__p + 8 * (v72 & 0x3FFFFFFFFFFFFFFCLL));
    float64x2_t v73 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&rect, 0);
    uint64_t v74 = (float64x2_t *)((char *)__p + 16);
    uint64_t v75 = v72 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      float64x2_t v76 = vsubq_f64(v74[-1], v73);
      float64x2_t v77 = vsubq_f64(*v74, v73);
      float64x2_t v78 = vmulq_f64(v76, v76);
      float64x2_t v79 = vmulq_f64(v77, v77);
      double v70 = v70 + v78.f64[0] + v78.f64[1] + v79.f64[0] + v79.f64[1];
      v74 += 2;
      v75 -= 4;
    }
    while (v75);
    if (v72 != (v72 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_133:
      do
      {
        double v80 = *v71++;
        double v70 = v70 + (v80 - rect) * (v80 - rect);
      }
      while (v71 != v30);
    }
    double v66 = sqrt(v70 / (double)(unint64_t)v68);
  }
  if (__p) {
    operator delete(__p);
  }

  double v270 = fmax(rect + v66 * 1.5, 30.0);
  double v271 = v270;
  if (v18 < 5) {
    goto LABEL_101;
  }
  id v86 = rect_24;
  id recta = v86;
  self;
  v286 = 0;
  uint64_t v287 = 0;
  v288 = 0;
  double v97 = 0.0;
  double v272 = 0.0;
  if ((unint64_t)objc_msgSend_count(v86, v87, v88, v89, v90, v91) < 2) {
    goto LABEL_100;
  }
  uint64_t v98 = objc_msgSend_firstObject(v86, v92, v93, v94, v95, v96);
  objc_msgSend_bounds(v98, v99, v100, v101, v102, v103);
  double MaxY = CGRectGetMaxY(v291);

  uint64_t v110 = 0;
  v111 = 0;
  uint64_t v112 = 0;
  uint64_t v113 = 0;
  unint64_t v114 = 1;
  double v115 = 0.0;
  while (2)
  {
    if (v114 < objc_msgSend_count(v86, v105, v106, v107, v108, v109))
    {
      uint64_t v121 = objc_msgSend_objectAtIndexedSubscript_(v86, v116, v114, v118, v119, v120);
      objc_msgSend_bounds(v121, v122, v123, v124, v125, v126);
      CGFloat x = v292.origin.x;
      CGFloat y = v292.origin.y;
      CGFloat width = v292.size.width;
      double height = v292.size.height;
      double v131 = CGRectGetMinY(v292) - MaxY;
      if (v131 >= 0.0) {
        double v132 = v131;
      }
      else {
        double v132 = 0.0;
      }
      if (v131 < height / -3.0)
      {
        ++v113;
LABEL_81:
        v293.origin.CGFloat x = x;
        v293.origin.CGFloat y = y;
        v293.size.CGFloat width = width;
        v293.size.double height = height;
        double MaxY = CGRectGetMaxY(v293);

        uint64_t v55 = v268;
        double v115 = v115 + v132;
        ++v114;
        continue;
      }
      if (v112 < v111)
      {
        double *v112 = v132;
        uint64_t v133 = (uint64_t)(v112 + 1);
LABEL_80:
        uint64_t v287 = v133;
        uint64_t v112 = (double *)v133;
        goto LABEL_81;
      }
      uint64_t v134 = v112 - v110;
      unint64_t v135 = v134 + 1;
      if ((unint64_t)(v134 + 1) >> 61) {
        sub_1C494A220();
      }
      if (((char *)v111 - (char *)v110) >> 2 > v135) {
        unint64_t v135 = ((char *)v111 - (char *)v110) >> 2;
      }
      if ((unint64_t)((char *)v111 - (char *)v110) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v136 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v136 = v135;
      }
      if (v136)
      {
        if (v136 >> 61) {
          sub_1C4949AA8();
        }
        v137 = operator new(8 * v136);
        v138 = (double *)&v137[8 * v134];
        double *v138 = v132;
        uint64_t v133 = (uint64_t)(v138 + 1);
        int64_t v139 = (char *)v112 - (char *)v110;
        if (v112 == v110) {
          goto LABEL_77;
        }
LABEL_74:
        unint64_t v140 = v139 - 8;
        if (v140 < 0x168)
        {
          v141 = v112;
          goto LABEL_76;
        }
        unint64_t v143 = ((char *)(v112 - 1) - (char *)v110) & 0xFFFFFFFFFFFFFFF8;
        if (&v137[(char *)v112 - (char *)v110 - 8 - v143] > &v137[(char *)v112 - (char *)v110 - 8])
        {
          v141 = v112;
          goto LABEL_76;
        }
        if ((double *)((char *)v112 - v143 - 8) > v112 - 1)
        {
          v141 = v112;
          goto LABEL_76;
        }
        if ((unint64_t)((char *)v110 - v137) < 0x20)
        {
          v141 = v112;
          goto LABEL_76;
        }
        uint64_t v144 = (v140 >> 3) + 1;
        uint64_t v145 = 8 * (v144 & 0x3FFFFFFFFFFFFFFCLL);
        v141 = &v112[v145 / 0xFFFFFFFFFFFFFFF8];
        v138 = (double *)((char *)v138 - v145);
        v146 = &v137[8 * v134 - 16];
        v147 = v112 - 2;
        uint64_t v148 = v144 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v149 = *(_OWORD *)v147;
          *(v146 - 1) = *((_OWORD *)v147 - 1);
          _OWORD *v146 = v149;
          v146 -= 2;
          v147 -= 4;
          v148 -= 4;
        }
        while (v148);
        if (v144 != (v144 & 0x3FFFFFFFFFFFFFFCLL))
        {
          do
          {
LABEL_76:
            uint64_t v142 = *((void *)v141-- - 1);
            *((void *)v138-- - 1) = v142;
          }
          while (v141 != v110);
        }
      }
      else
      {
        v137 = 0;
        v138 = (double *)(8 * v134);
        *(double *)(8 * v134) = v132;
        uint64_t v133 = 8 * v134 + 8;
        int64_t v139 = (char *)v112 - (char *)v110;
        if (v112 != v110) {
          goto LABEL_74;
        }
      }
LABEL_77:
      v111 = (double *)&v137[8 * v136];
      v286 = v138;
      v288 = v111;
      if (v110) {
        operator delete(v110);
      }
      uint64_t v110 = v138;
      id v86 = recta;
      goto LABEL_80;
    }
    break;
  }
  double v150 = v115 / (double)(unint64_t)(objc_msgSend_count(v86, v116, v117, v118, v119, v120) + ~v113);
  uint64_t v151 = (char *)v112 - (char *)v110;
  double v272 = v150;
  if (v112 == v110)
  {
    double v97 = 0.0;
    if (v110) {
      goto LABEL_99;
    }
  }
  else
  {
    uint64_t v152 = v151 >> 3;
    unint64_t v153 = v151 - 8;
    double v154 = 0.0;
    v155 = v110;
    if (v153 < 0x18) {
      goto LABEL_134;
    }
    uint64_t v156 = (v153 >> 3) + 1;
    v155 = &v110[v156 & 0x3FFFFFFFFFFFFFFCLL];
    float64x2_t v157 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v150, 0);
    v158 = (float64x2_t *)(v110 + 2);
    uint64_t v159 = v156 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      float64x2_t v160 = vsubq_f64(v158[-1], v157);
      float64x2_t v161 = vsubq_f64(*v158, v157);
      float64x2_t v162 = vmulq_f64(v160, v160);
      float64x2_t v163 = vmulq_f64(v161, v161);
      double v154 = v154 + v162.f64[0] + v162.f64[1] + v163.f64[0] + v163.f64[1];
      v158 += 2;
      v159 -= 4;
    }
    while (v159);
    if (v156 != (v156 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_134:
      do
      {
        double v164 = *v155++;
        double v154 = v154 + (v164 - v150) * (v164 - v150);
      }
      while (v155 != v112);
    }
    double v97 = sqrt(v154 / (double)(unint64_t)v152);
    if (v110) {
LABEL_99:
    }
      operator delete(v110);
  }
LABEL_100:

  double v271 = fmax(v272 + v97 * 1.5, 5.0);
LABEL_101:
  unint64_t v165 = 0;
  while (v165 < objc_msgSend_count(rect_24, v81, v82, v83, v84, v85))
  {
    if (objc_msgSend_containsIndex_(v273, v166, v165, v167, v168, v169))
    {
      ++v165;
    }
    else
    {
      v170 = objc_msgSend_objectAtIndexedSubscript_(rect_24, v81, v165, v83, v84, v85);
      objc_msgSend_addIndex_(v273, v171, v165, v172, v173, v174);
      v179 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v175, (uint64_t)v170, v176, v177, v178);
      objc_msgSend_bounds(v170, v180, v181, v182, v183, v184);
      CGFloat rectb = v193;
      if (v55 > (uint64_t)(v165 + 1))
      {
        CGFloat v194 = v190;
        CGFloat v195 = v191;
        CGFloat v196 = v192;
        uint64_t v197 = 1;
        do
        {
          v198 = objc_msgSend_objectAtIndexedSubscript_(rect_24, v185, v165 + v197, v187, v188, v189);
          objc_msgSend_bounds(v198, v199, v200, v201, v202, v203);
          CGFloat v205 = v204;
          CGFloat v207 = v206;
          CGFloat v209 = v208;
          CGFloat v211 = v210;

          v294.origin.CGFloat x = v205;
          v294.origin.CGFloat y = v207;
          v294.size.CGFloat width = v209;
          v294.size.double height = v211;
          double MinY = CGRectGetMinY(v294);
          v295.origin.CGFloat x = rectb;
          v295.origin.CGFloat y = v194;
          v295.size.CGFloat width = v195;
          v295.size.double height = v196;
          double v213 = CGRectGetMaxY(v295);
          if (v197 == 11) {
            break;
          }
          float v214 = MinY - v213;
          double v215 = v214;
          if (v271 <= v215 || v270 < v215) {
            break;
          }
          v217 = objc_msgSend_objectAtIndexedSubscript_(rect_24, v185, v165 + v197, v187, v188, v189);
          objc_msgSend_addObject_(v179, v218, (uint64_t)v217, v219, v220, v221);

          objc_msgSend_addIndex_(v273, v222, v165 + v197++, v223, v224, v225);
          CGFloat rectb = v205;
          CGFloat v194 = v207;
          CGFloat v195 = v209;
          CGFloat v196 = v211;
        }
        while (v55 - v165 != v197);
      }
      objc_msgSend_bounds(v170, v185, v186, v187, v188, v189);
      CGFloat rectc = v233;
      if (v165)
      {
        CGFloat v234 = v230;
        CGFloat v235 = v231;
        CGFloat v236 = v232;
        uint64_t v237 = 0;
        do
        {
          v238 = objc_msgSend_objectAtIndexedSubscript_(rect_24, v226, v165 + v237 - 1, v227, v228, v229);
          objc_msgSend_bounds(v238, v239, v240, v241, v242, v243);
          CGFloat v245 = v244;
          CGFloat v247 = v246;
          CGFloat v249 = v248;
          CGFloat v251 = v250;

          v296.origin.CGFloat x = rectc;
          v296.origin.CGFloat y = v234;
          v296.size.CGFloat width = v235;
          v296.size.double height = v236;
          double v252 = CGRectGetMinY(v296);
          CGFloat v234 = v247;
          CGFloat v235 = v249;
          CGFloat v236 = v251;
          CGFloat rectc = v245;
          v297.origin.CGFloat x = v245;
          v297.origin.CGFloat y = v247;
          v297.size.CGFloat width = v249;
          v297.size.double height = v251;
          double v253 = CGRectGetMaxY(v297);
          if (v237 == -10) {
            break;
          }
          float v254 = v252 - v253;
          double v255 = v254;
          if (v271 <= v255 || v270 < v255) {
            break;
          }
          v257 = objc_msgSend_objectAtIndexedSubscript_(rect_24, v226, v165 + v237 - 1, v227, v228, v229);
          objc_msgSend_addObject_(v179, v258, (uint64_t)v257, v259, v260, v261);

          objc_msgSend_addIndex_(v273, v262, v165 + v237-- - 1, v263, v264, v265);
        }
        while (v165 + v237);
      }
      objc_msgSend_addObject_(v269, v226, (uint64_t)v179, v227, v228, v229);

      ++v165;
    }
  }

  return v269;
}

+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  uint64_t v10 = objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v7, v8, (uint64_t)v5, (uint64_t)v6, 0, v9);

  return v10;
}

+ (id)strokeGroupContainingStrokeIdentifier:(id)a3 strokeGroups:(id)a4 foundStrokeGroupIndex:(int64_t *)a5
{
  id v7 = a3;
  id v13 = a4;
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= objc_msgSend_count(v13, v8, v9, v10, v11, v12))
    {
      uint64_t v31 = 0;
      if (!a5) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
    id v19 = objc_msgSend_objectAtIndexedSubscript_(v13, v15, i, v16, v17, v18);
    uint64_t v25 = objc_msgSend_strokeIdentifiers(v19, v20, v21, v22, v23, v24);
    int v30 = objc_msgSend_containsObject_(v25, v26, (uint64_t)v7, v27, v28, v29);

    if (v30) {
      break;
    }
  }
  uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(v13, v8, i, v10, v11, v12);
  if (!a5) {
    goto LABEL_11;
  }
  *a5 = i;
LABEL_9:
  if (!v31) {
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_11:

  return v31;
}

+ (id)strokeGroupClosestToPoint:(CGPoint)a3 strokeGroups:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  id v7 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    double v119 = x;
    __int16 v120 = 2048;
    double v121 = y;
    _os_log_impl(&dword_1C492D000, v7, OS_LOG_TYPE_DEFAULT, "Finding the stroke group closest to point: (%f, %f)", buf, 0x16u);
  }

  if (objc_msgSend_count(v6, v8, v9, v10, v11, v12))
  {
    __p = 0;
    int v116 = 0;
    uint64_t v117 = 0;
    unint64_t v18 = objc_msgSend_count(v6, v13, v14, v15, v16, v17);
    unint64_t v24 = v18;
    if (v18)
    {
      if (v18 >> 61) {
        sub_1C494A220();
      }
      __p = (void **)operator new(8 * v18);
      int v116 = __p;
      uint64_t v117 = &__p[v24];
    }
    for (unint64_t i = 0; ; ++i)
    {
      if (i >= objc_msgSend_count(v6, v19, v20, v21, v22, v23))
      {
        uint64_t v57 = __p;
        uint64_t v58 = __p + 1;
        if (__p != v116 && v58 != v116)
        {
          do
          {
            uint64_t v60 = *v58;
            id v61 = *v57;
            double v62 = sub_1C4A1E4EC((uint64_t)CHStrokeGroup, v60);
            objc_msgSend_distanceFromPoint_toRectangle_(CHStrokeUtilities, v63, v64, v65, v66, v67, x, y, v62, v68, v69, v70);
            double v72 = v71;
            double v73 = sub_1C4A1E4EC((uint64_t)CHStrokeGroup, v61);
            objc_msgSend_distanceFromPoint_toRectangle_(CHStrokeUtilities, v74, v75, v76, v77, v78, x, y, v73, v79, v80, v81);
            LODWORD(v60) = v72 < v82;

            if (v60) {
              uint64_t v57 = v58;
            }
            ++v58;
          }
          while (v58 != v116);
        }
        id v26 = *v57;
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        uint64_t v83 = (id)qword_1EA3C9FA0;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend_bounds(v26, v84, v85, v86, v87, v88);
          double v90 = v89;
          objc_msgSend_bounds(v26, v91, v92, v93, v94, v95);
          double v97 = v96;
          objc_msgSend_bounds(v26, v98, v99, v100, v101, v102);
          uint64_t v104 = v103;
          objc_msgSend_bounds(v26, v105, v106, v107, v108, v109);
          *(_DWORD *)buf = 134219264;
          double v119 = v90;
          __int16 v120 = 2048;
          double v121 = v97;
          __int16 v122 = 2048;
          uint64_t v123 = v104;
          __int16 v124 = 2048;
          uint64_t v125 = v110;
          __int16 v126 = 2048;
          double v127 = x;
          __int16 v128 = 2048;
          double v129 = y;
          _os_log_impl(&dword_1C492D000, v83, OS_LOG_TYPE_DEFAULT, "Found the stroke group with origin: (%f, %f) and size: (%f, %f) closest to point: (%f, %f)", buf, 0x3Eu);
        }

        if (__p)
        {
          v111 = v116;
          uint64_t v112 = __p;
          if (v116 != __p)
          {
            do
            {
              uint64_t v113 = *--v111;
            }
            while (v111 != __p);
            uint64_t v112 = __p;
          }
          operator delete(v112);
        }
        goto LABEL_58;
      }
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v6, v28, i, v29, v30, v31);
      uint64_t v33 = v32;
      double v34 = v116;
      if (v116 < v117)
      {
        *int v116 = (void *)v32;
        uint64_t v35 = (uint64_t)(v116 + 1);
        goto LABEL_41;
      }
      uint64_t v36 = v116 - __p;
      unint64_t v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 61) {
        sub_1C494A220();
      }
      uint64_t v38 = (char *)v117 - (char *)__p;
      if (((char *)v117 - (char *)__p) >> 2 > v37) {
        unint64_t v37 = v38 >> 2;
      }
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39)
      {
        if (v39 >> 61) {
          sub_1C4949AA8();
        }
        unint64_t v40 = (char *)operator new(8 * v39);
        CGFloat v41 = (uint64_t *)&v40[8 * v36];
        uint64_t v42 = &v40[8 * v39];
        *CGFloat v41 = v33;
        uint64_t v35 = (uint64_t)(v41 + 1);
        int64_t v43 = (char *)v116 - (char *)__p;
        if (v116 != __p)
        {
LABEL_27:
          unint64_t v44 = v43 - 8;
          if (v44 < 0x78) {
            goto LABEL_66;
          }
          unint64_t v45 = ((char *)(v116 - 1) - (char *)__p) & 0xFFFFFFFFFFFFFFF8;
          if ((char *)v116 - v45 - 8 < (char *)v41 && &v40[(char *)v116 - (char *)__p - v45 - 8] < (char *)v116) {
            goto LABEL_66;
          }
          uint64_t v46 = (v44 >> 3) + 1;
          uint64_t v47 = 8 * (v46 & 0x3FFFFFFFFFFFFFFCLL);
          CGFloat v41 = (uint64_t *)((char *)v41 - v47);
          unint64_t v48 = &v116[v47 / 0xFFFFFFFFFFFFFFF8];
          uint64_t v49 = v116 - 2;
          uint64_t v50 = &v40[8 * v36 - 16];
          uint64_t v51 = v46 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v53 = *((_OWORD *)v49 - 1);
            long long v52 = *(_OWORD *)v49;
            *((_OWORD *)v49 - 1) = 0uLL;
            *(_OWORD *)uint64_t v49 = 0uLL;
            *((_OWORD *)v50 - 1) = v53;
            *(_OWORD *)uint64_t v50 = v52;
            v49 -= 4;
            v50 -= 32;
            v51 -= 4;
          }
          while (v51);
          double v34 = v48;
          if (v46 != (v46 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_66:
            do
            {
              uint64_t v54 = (uint64_t)*--v34;
              *double v34 = 0;
              *--CGFloat v41 = v54;
            }
            while (v34 != __p);
          }
          double v34 = __p;
          uint64_t v55 = v116;
          __p = (void **)v41;
          uint64_t v117 = (void **)v42;
          while (v55 != v34)
          {
            uint64_t v56 = *--v55;
          }
          goto LABEL_39;
        }
      }
      else
      {
        unint64_t v40 = 0;
        CGFloat v41 = (uint64_t *)(8 * v36);
        uint64_t v42 = 0;
        *(void *)(8 * v36) = v33;
        uint64_t v35 = 8 * v36 + 8;
        int64_t v43 = (char *)v116 - (char *)__p;
        if (v116 != __p) {
          goto LABEL_27;
        }
      }
      __p = (void **)v41;
      uint64_t v117 = (void **)v42;
LABEL_39:
      if (v34) {
        operator delete(v34);
      }
LABEL_41:
      int v116 = (void **)v35;
    }
  }
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v25 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    double v119 = x;
    __int16 v120 = 2048;
    double v121 = y;
    _os_log_impl(&dword_1C492D000, v25, OS_LOG_TYPE_ERROR, "Stroke Groups is empty, cannot find the closest stroke group to point: (%f, %f)", buf, 0x16u);
  }

  id v26 = 0;
LABEL_58:

  return v26;
}

+ (void)strokeGroupsContainingPoint:(CGPoint)a3 strokeGroups:(id)a4 groupProcessingBlock:(id)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  uint64_t v14 = (void (**)(id, void *, unint64_t, unsigned char *))a5;
  unint64_t v15 = 0;
  char v21 = 0;
  while (v15 < objc_msgSend_count(v8, v9, v10, v11, v12, v13))
  {
    uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v8, v16, v15, v17, v18, v19);
    v23.origin.CGFloat x = sub_1C4A1E4EC((uint64_t)CHStrokeGroup, v20);
    v22.CGFloat x = x;
    v22.CGFloat y = y;
    if (CGRectContainsPoint(v23, v22))
    {
      v14[2](v14, v20, v15, &v21);
      if (v21)
      {

        break;
      }
    }

    ++v15;
  }
}

+ (id)strokeIdentifierToGroupIndexMappingForStrokeIdentifiers:(id)a3 orderedStrokeGroups:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9, v10, v11);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v5;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v42, (uint64_t)v48, 16, v14);
  if (v15)
  {
    uint64_t v16 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v19 = objc_opt_class();
        id v22 = (id)objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v19, v20, v18, (uint64_t)v6, (uint64_t)&v41, v21);
        if (v41 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (qword_1EA3CA000 != -1) {
            dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          }
          uint64_t v33 = (id)qword_1EA3C9FA0;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v47 = v18;
            _os_log_impl(&dword_1C492D000, v33, OS_LOG_TYPE_ERROR, "No group found for stroke identifier %@, All strokes should belong to a group.", buf, 0xCu);
          }

          objc_msgSend_removeAllObjects(v12, v34, v35, v36, v37, v38);
          goto LABEL_15;
        }
        uint64_t v27 = objc_msgSend_numberWithInteger_(NSNumber, v23, v41, v24, v25, v26);
        objc_msgSend_setObject_forKey_(v12, v28, (uint64_t)v27, v18, v29, v30);
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v42, (uint64_t)v48, 16, v32);
      if (v15) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v12;
}

- (CRNormalizedQuad)boundingQuad
{
  id v3 = objc_alloc(MEMORY[0x1E4FAF188]);
  objc_msgSend_bounds(self, v4, v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_initWithNormalizedBoundingBox_size_(v3, v9, v10, v11, v12, v13);
  objc_msgSend_normalizedSize(self, v15, v16, v17, v18, v19);
  if (v26 != *MEMORY[0x1E4F1DB30] || v25 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_msgSend_averageWritingOrientation(self, v20, v21, v22, v23, v24);
    double v29 = v28;
    objc_msgSend_averageWritingOrientation(self, v30, v31, v32, v33, v34);
    if (v29 >= 0.0) {
      double v41 = v40;
    }
    else {
      double v41 = -v40;
    }
    if (v29 >= 0.0) {
      double v42 = v29;
    }
    else {
      double v42 = -v29;
    }
    objc_msgSend_normalizedSize(self, v35, v36, v37, v38, v39, -v29);
    double v44 = v43;
    objc_msgSend_normalizedSize(self, v45, v46, v47, v48, v49);
    double v51 = v50;
    objc_msgSend_normalizedSize(self, v52, v53, v54, v55, v56);
    double v58 = v57;
    objc_msgSend_normalizedSize(self, v59, v60, v61, v62, v63);
    double v65 = v64;
    objc_msgSend_bounds(self, v66, v67, v68, v69, v70);
    double MidX = CGRectGetMidX(v90);
    objc_msgSend_bounds(self, v72, v73, v74, v75, v76);
    double MidY = CGRectGetMidY(v91);
    id v78 = objc_alloc(MEMORY[0x1E4FAF188]);
    double v79 = v42 * v44 * 0.5;
    double v80 = v41 * v51 * 0.5;
    double v81 = v41 * v58 * 0.5;
    uint64_t v87 = objc_msgSend_initWithNormalizedTopLeft_topRight_bottomRight_bottomLeft_size_(v78, v82, v83, v84, v85, v86, v81 + MidX - v79, MidY - v80 - v42 * v65 * 0.5, v81 + v79 + MidX, v80 + MidY - v42 * v65 * 0.5, v79 + MidX - v81, v42 * v65 * 0.5 + v80 + MidY, MidX - v79 - v81, v42 * v65 * 0.5 + MidY - v80, 0x3FF0000000000000, 0x3FF0000000000000);

    uint64_t v14 = (void *)v87;
  }
  return (CRNormalizedQuad *)v14;
}

- (unint64_t)layoutDirection
{
  uint64_t v6 = objc_msgSend_classification(self, a2, v2, v3, v4, v5);
  if ((unint64_t)(v6 - 1) > 7) {
    return 0;
  }
  else {
    return qword_1C4C3A8F0[v6 - 1];
  }
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)ancestorIdentifier
{
  return self->_ancestorIdentifier;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)firstStrokeOrigin
{
  double x = self->_firstStrokeOrigin.x;
  double y = self->_firstStrokeOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSSet)strokeIdentifiers
{
  return self->_strokeIdentifiers;
}

- (CHEncodedStrokeIdentifier)firstStrokeIdentifier
{
  return self->_firstStrokeIdentifier;
}

- (CHEncodedStrokeIdentifier)lastStrokeIdentifier
{
  return self->_lastStrokeIdentifier;
}

- (int64_t)classification
{
  return self->_classification;
}

- (double)groupingConfidence
{
  return self->_groupingConfidence;
}

- (NSString)strategyIdentifier
{
  return self->_strategyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_firstStrokeIdentifier, 0);
  objc_storeStrong((id *)&self->_strokeIdentifiers, 0);
}

@end