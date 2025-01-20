@interface EventServiceHost
- (EventServiceHost)init;
@end

@implementation EventServiceHost

- (EventServiceHost)init
{
  v29.receiver = self;
  v29.super_class = (Class)EventServiceHost;
  val = [(EventServiceHost *)&v29 init];
  if (val)
  {
    v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = dispatch_queue_attr_make_with_qos_class(v2, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.EventServiceHost.dispatch", v3);
    queue = val->_queue;
    val->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    onQueue_extensionRequestForIdentifier = val->_onQueue_extensionRequestForIdentifier;
    val->_onQueue_extensionRequestForIdentifier = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    onQueue_extensionRequestsForBundleID = val->_onQueue_extensionRequestsForBundleID;
    val->_onQueue_extensionRequestsForBundleID = v8;

    uint64_t v28 = 0;
    v47[0] = NSExtensionPointName;
    v47[1] = @"ENTITLEMENT:com.apple.appstored-services.event";
    v48[0] = @"com.apple.appstored-services.event";
    v48[1] = &__kCFBooleanTrue;
    v10 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    uint64_t v11 = +[NSExtension extensionsWithMatchingAttributes:v10 error:&v28];
    extensions = val->_extensions;
    val->_extensions = (NSArray *)v11;

    if (v28)
    {
      v13 = ASDLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v50 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error fetching extensions: %{public}@", buf, 0xCu);
      }
    }
    objc_initWeak(&location, val);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100330DF4;
    v44[3] = &unk_1005286D0;
    v24 = &v45;
    objc_copyWeak(&v45, &location);
    v14 = objc_retainBlock(v44);
    id v15 = [v14 copy];

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100330F44;
    v42[3] = &unk_100528738;
    id v27 = v15;
    id v43 = v27;
    v16 = objc_retainBlock(v42);
    id v17 = [v16 copy];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    obj = val->_extensions;
    id v18 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:buf count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v39;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          objc_initWeak(&from, v21);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100331104;
          v35[3] = &unk_100528760;
          id v22 = v17;
          id v36 = v22;
          objc_msgSend(v21, "setRequestCompletionBlock:", v35, v24);
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_1003311F4;
          v33[3] = &unk_100528788;
          id v34 = v22;
          [v21 setRequestCancellationBlock:v33];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_1003312E4;
          v30[3] = &unk_1005287D8;
          objc_copyWeak(&v32, &from);
          id v31 = v27;
          [v21 setRequestInterruptionBlock:v30];

          objc_destroyWeak(&v32);
          objc_destroyWeak(&from);
        }
        id v18 = [(NSArray *)obj countByEnumeratingWithState:&v38 objects:buf count:16];
      }
      while (v18);
    }

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  return val;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onQueue_extensionRequestForIdentifier, 0);
  objc_storeStrong((id *)&self->_onQueue_extensionRequestsForBundleID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

@end