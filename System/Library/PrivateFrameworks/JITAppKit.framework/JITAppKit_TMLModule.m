@interface JITAppKit_TMLModule
+ (BOOL)loadModule;
+ (void)initializeJSContext:(id)a3;
@end

@implementation JITAppKit_TMLModule

+ (BOOL)loadModule
{
  id v16 = a1;
  SEL v15 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  int v12 = 0x20000000;
  int v13 = 32;
  char v14 = 1;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __33__JITAppKit_TMLModule_loadModule__block_invoke;
  v8 = &unk_26485A7D8;
  v9 = &v10;
  v18 = (dispatch_once_t *)&loadModule_onceToken;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  char v3 = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v3 & 1;
}

+ (void)initializeJSContext:(id)a3
{
  v57[2] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = (void *)MEMORY[0x263F10390];
  id v4 = (id)[location[0] context];
  id v38 = (id)objc_msgSend(v3, "valueWithNewObjectInContext:");

  id v5 = location[0];
  v21 = (void *)MEMORY[0x263F10368];
  v56[0] = *MEMORY[0x263F10368];
  v57[0] = v38;
  v22 = (void *)MEMORY[0x263F10370];
  v56[1] = *MEMORY[0x263F10370];
  uint64_t v23 = MEMORY[0x263EFFA80];
  v57[1] = MEMORY[0x263EFFA80];
  id v6 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56);
  objc_msgSend(v5, "defineProperty:descriptor:", @"JITAppKit");

  id v37 = _Block_copy(&__block_literal_global_0);
  id v36 = _Block_copy(&__block_literal_global_9);
  id v7 = v38;
  v54[0] = *MEMORY[0x263F10358];
  v55[0] = v37;
  v54[1] = *MEMORY[0x263F10360];
  v55[1] = v36;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2];
  objc_msgSend(v7, "defineProperty:descriptor:", @"baseURL");

  id v35 = _Block_copy(&__block_literal_global_15);
  id v9 = v38;
  v52[0] = *v21;
  v53[0] = v35;
  v52[1] = *v22;
  v53[1] = v23;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
  objc_msgSend(v9, "defineProperty:descriptor:", @"loadPage");

  id v34 = _Block_copy(&__block_literal_global_22);
  id v11 = v38;
  v50[0] = *v21;
  v51[0] = v34;
  v50[1] = *v22;
  v51[1] = v23;
  id v12 = (id)[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
  objc_msgSend(v11, "defineProperty:descriptor:", @"loadPageWithData");

  id v33 = _Block_copy(&__block_literal_global_28);
  id v13 = v38;
  v48[0] = *v21;
  v49[0] = v33;
  v48[1] = *v22;
  v49[1] = v23;
  id v14 = (id)[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  objc_msgSend(v13, "defineProperty:descriptor:", @"loadPageWithDataURL");

  id v32 = _Block_copy(&__block_literal_global_34);
  id v15 = v38;
  v46[0] = *v21;
  v47[0] = v32;
  v46[1] = *v22;
  v47[1] = v23;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  objc_msgSend(v15, "defineProperty:descriptor:", @"loadView");

  id v31 = _Block_copy(&__block_literal_global_39);
  id v17 = v38;
  v44[0] = *v21;
  v45[0] = v31;
  v44[1] = *v22;
  v45[1] = v23;
  id v18 = (id)[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  objc_msgSend(v17, "defineProperty:descriptor:", @"loadClass");

  id v30 = _Block_copy(&__block_literal_global_44);
  id v19 = v38;
  v42[0] = *v21;
  v43[0] = v30;
  v42[1] = *v22;
  v43[1] = v23;
  id v20 = (id)[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
  objc_msgSend(v19, "defineProperty:descriptor:", @"loadObject");

  id v29 = _Block_copy(&__block_literal_global_50);
  id v24 = v38;
  v40[0] = *v21;
  v41[0] = v29;
  v40[1] = *v22;
  v41[1] = v23;
  id v25 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  objc_msgSend(v24, "defineProperty:descriptor:", @"dismissApplication");

  id v26 = _Block_copy(&__block_literal_global_56);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  id v27 = _Block_copy(&__block_literal_global_66);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  id v28 = _Block_copy(&__block_literal_global_72);
  objc_msgSend(location[0], "setObject:forKeyedSubscript:");

  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

@end