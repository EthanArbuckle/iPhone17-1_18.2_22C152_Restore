@interface BDSBookWidgetInfoMO
+ (id)fetchRequest;
- (id)getBookWidgetInfoObject;
- (id)initIntoManagedObjectContext:(id)a3;
@end

@implementation BDSBookWidgetInfoMO

- (id)initIntoManagedObjectContext:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF240];
  id v5 = a3;
  v11 = objc_msgSend_entityForName_inManagedObjectContext_(v4, v6, @"BDSBookWidgetInfoMO", (uint64_t)v5, v7, v8, v9, v10);
  v14.receiver = self;
  v14.super_class = (Class)BDSBookWidgetInfoMO;
  v12 = [(BDSBookWidgetInfoMO *)&v14 initWithEntity:v11 insertIntoManagedObjectContext:v5];

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend_fetchRequestWithEntityName_(MEMORY[0x263EFF260], a2, @"BDSBookWidgetInfoMO", v2, v3, v4, v5, v6);
}

- (id)getBookWidgetInfoObject
{
  uint64_t v3 = [BDSBookWidgetInfo alloc];
  v11 = objc_msgSend_assetID(self, v4, v5, v6, v7, v8, v9, v10);
  v19 = objc_msgSend_title(self, v12, v13, v14, v15, v16, v17, v18);
  v27 = objc_msgSend_coverURL(self, v20, v21, v22, v23, v24, v25, v26);
  v35 = objc_msgSend_pageProgressionDirection(self, v28, v29, v30, v31, v32, v33, v34);
  v43 = objc_msgSend_cloudAssetType(self, v36, v37, v38, v39, v40, v41, v42);
  v51 = objc_msgSend_libraryContentAssetType(self, v44, v45, v46, v47, v48, v49, v50);
  v59 = objc_msgSend_lastEngagedDate(self, v52, v53, v54, v55, v56, v57, v58);
  char isTrackedAsRecent = objc_msgSend_isTrackedAsRecent(self, v60, v61, v62, v63, v64, v65, v66);
  v68 = objc_msgSend_initWithAssetID_title_coverURL_pageProgressionDirection_cloudAssetType_libraryContentAssetType_lastEngagedDate_isTrackedAsRecent_(v3, v67, (uint64_t)v11, (uint64_t)v19, (uint64_t)v27, (uint64_t)v35, (uint64_t)v43, (uint64_t)v51, v59, isTrackedAsRecent);

  uint64_t isExplicit = objc_msgSend_isExplicit(self, v69, v70, v71, v72, v73, v74, v75);
  objc_msgSend_setIsExplicit_(v68, v77, isExplicit, v78, v79, v80, v81, v82);
  return v68;
}

@end