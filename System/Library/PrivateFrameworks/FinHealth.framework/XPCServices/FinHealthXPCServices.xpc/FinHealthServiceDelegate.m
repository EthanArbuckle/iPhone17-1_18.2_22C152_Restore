@interface FinHealthServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation FinHealthServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v63 = a4;
  v64 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FinHealthXPCServicesProtocol];
  uint64_t v61 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v62 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v61, v4, v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  uint64_t v60 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  v65 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v60, v13, v14, v15, v16, v17, v18, v19, v20, objc_opt_class(), 0);
  [v64 setClasses:v62 forSelector:"transactionUpdated:deferFeatureComputation:completion:" argumentIndex:0 ofReply:0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, v23, v24, v25, v26, v27, v28, objc_opt_class(), 0);
  [v64 setClasses:v29 forSelector:"featuresWithCompletion:" argumentIndex:0 ofReply:0];

  uint64_t v59 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v59, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, objc_opt_class(), 0);
  [v64 setClasses:v40 forSelector:"featuresForApplication:withCompletion:" argumentIndex:0 ofReply:0];

  [v64 setClasses:v65 forSelector:"featureResponsesForApplication:completion:" argumentIndex:0 ofReply:0];
  [v64 setClasses:v65 forSelector:"paymentRingSuggestionsFromSearchFeatures:startDate:endDate:completion:" argumentIndex:0 ofReply:0];
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v47 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v41, v42, v43, v44, v45, v46, objc_opt_class(), 0);
  [v64 setClasses:v47 forSelector:"getComputedFeaturesForTransactions:completion:" argumentIndex:0 ofReply:0];

  uint64_t v48 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, v49, v50, v51, v52, v53, objc_opt_class(), 0);
  [v64 setClasses:v54 forSelector:"recomputeFeaturesForTransactions:" argumentIndex:0 ofReply:0];

  uint64_t v55 = objc_opt_class();
  v56 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v55, objc_opt_class(), 0);
  [v64 setClasses:v56 forSelector:"aggregateFeaturesWithHandler:" argumentIndex:0 ofReply:0];

  [v63 setExportedInterface:v64];
  v57 = [[FinHealthXPCServices alloc] initWithConnection:v63];
  [v63 setExportedObject:v57];
  [v63 resume];

  return 1;
}

@end