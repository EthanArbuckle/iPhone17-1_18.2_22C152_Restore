@interface CPLCKRecordPropertyMapping
+ (CPLCKRecordPropertyMapping)sharedInstance;
+ (NSSet)allSupportedClasses;
+ (NSSet)commonProperties;
- (BOOL)doesRecordClassSupportSparseRecords:(Class)a3;
- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forCKKey:(id)a5;
- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forProperty:(id)a5;
- (BOOL)isKeyReadOnly:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldSplitIndirectRecordForKey:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnBothRecords:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnPrivateRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdateKeyOnSharedRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4;
- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4;
- (NSDictionary)allPrivateCKKeys;
- (NSDictionary)allPrivateProperties;
- (NSDictionary)allResourcesCKKeys;
- (NSDictionary)allSharedAndPrivateCKKeys;
- (NSDictionary)allSharedCKKeys;
- (NSDictionary)allSharedProperties;
- (NSDictionary)propertiesKeysPairings;
- (id)allTranslatedPropertiesForClass:(Class)a3;
- (id)initSharedInstance;
@end

@implementation CPLCKRecordPropertyMapping

+ (CPLCKRecordPropertyMapping)sharedInstance
{
  if (qword_1002CE760 != -1) {
    dispatch_once(&qword_1002CE760, &stru_100278E78);
  }
  v2 = (void *)qword_1002CE758;
  return (CPLCKRecordPropertyMapping *)v2;
}

+ (NSSet)commonProperties
{
  if (qword_1002CE7A0 != -1) {
    dispatch_once(&qword_1002CE7A0, &stru_1002790B0);
  }
  v2 = (void *)qword_1002CE798;
  return (NSSet *)v2;
}

+ (NSSet)allSupportedClasses
{
  if (qword_1002CE770 != -1) {
    dispatch_once(&qword_1002CE770, &stru_100278E98);
  }
  v2 = (void *)qword_1002CE768;
  return (NSSet *)v2;
}

- (id)initSharedInstance
{
  v165.receiver = self;
  v165.super_class = (Class)CPLCKRecordPropertyMapping;
  v71 = [(CPLCKRecordPropertyMapping *)&v165 init];
  if (v71)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v80 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    id v78 = objc_alloc_init((Class)NSMutableDictionary);
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    v163[0] = 0;
    v163[1] = v163;
    v163[2] = 0x3032000000;
    v163[3] = sub_100072DC4;
    v163[4] = sub_100072DD4;
    id v164 = 0;
    v161[0] = 0;
    v161[1] = v161;
    v161[2] = 0x3032000000;
    v161[3] = sub_100072DC4;
    v161[4] = sub_100072DD4;
    id v162 = 0;
    v160[0] = 0;
    v160[1] = v160;
    v160[2] = 0x2050000000;
    v160[3] = 0;
    v158[0] = 0;
    v158[1] = v158;
    v158[2] = 0x3032000000;
    v158[3] = sub_100072DC4;
    v158[4] = sub_100072DD4;
    id v159 = 0;
    v156[0] = 0;
    v156[1] = v156;
    v156[2] = 0x3032000000;
    v156[3] = sub_100072DC4;
    v156[4] = sub_100072DD4;
    id v157 = 0;
    v154[0] = 0;
    v154[1] = v154;
    v154[2] = 0x3032000000;
    v154[3] = sub_100072DC4;
    v154[4] = sub_100072DD4;
    id v155 = 0;
    v152[0] = 0;
    v152[1] = v152;
    v152[2] = 0x3032000000;
    v152[3] = sub_100072DC4;
    v152[4] = sub_100072DD4;
    id v153 = 0;
    v150[0] = 0;
    v150[1] = v150;
    v150[2] = 0x3032000000;
    v150[3] = sub_100072DC4;
    v150[4] = sub_100072DD4;
    id v151 = 0;
    v148[0] = 0;
    v148[1] = v148;
    v148[2] = 0x2020000000;
    char v149 = 0;
    v147[0] = 0;
    v147[1] = v147;
    v147[2] = 0x2020000000;
    v147[3] = 0;
    v145[0] = 0;
    v145[1] = v145;
    v145[2] = 0x3032000000;
    v145[3] = sub_100072DC4;
    v145[4] = sub_100072DD4;
    id v146 = 0;
    v143[0] = 0;
    v143[1] = v143;
    v143[2] = 0x3032000000;
    v143[3] = sub_100072DC4;
    v143[4] = sub_100072DD4;
    id v144 = 0;
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472;
    v133[2] = sub_100072DDC;
    v133[3] = &unk_100278EC0;
    v137 = v160;
    v138 = v158;
    v139 = v156;
    v68 = (NSDictionary *)v3;
    v134 = v68;
    v67 = (NSDictionary *)v4;
    v135 = v67;
    v140 = v163;
    v141 = v161;
    v142 = v145;
    v66 = (NSDictionary *)v7;
    v136 = v66;
    v8 = objc_retainBlock(v133);
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_100072EFC;
    v130[3] = &unk_100275F88;
    v132 = v160;
    v64 = (NSDictionary *)v6;
    v131 = v64;
    v77 = objc_retainBlock(v130);
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_100073098;
    v125[3] = &unk_100278F10;
    v127 = v154;
    v128 = v150;
    v129 = v152;
    v9 = v8;
    id v126 = v9;
    v76 = objc_retainBlock(v125);
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_100073118;
    v119[3] = &unk_100278F38;
    v123 = v154;
    v124 = v150;
    v65 = (NSDictionary *)v80;
    v120 = v65;
    v63 = (NSDictionary *)v5;
    v121 = v63;
    v61 = v9;
    id v122 = v61;
    v70 = objc_retainBlock(v119);
    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472;
    v118[2] = sub_1000731D0;
    v118[3] = &unk_100278F60;
    v118[4] = v163;
    v118[5] = v143;
    v118[6] = v145;
    v10 = objc_retainBlock(v118);
    v117[0] = _NSConcreteStackBlock;
    v117[1] = 3221225472;
    v117[2] = sub_10007326C;
    v117[3] = &unk_100275F60;
    v117[4] = v143;
    v11 = objc_retainBlock(v117);
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472;
    v114[2] = sub_100073280;
    v114[3] = &unk_100278F88;
    v12 = v10;
    id v115 = v12;
    v13 = v11;
    id v116 = v13;
    v69 = objc_retainBlock(v114);
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472;
    v105[2] = sub_1000732CC;
    v105[3] = &unk_100278FB0;
    v108 = v143;
    SEL v113 = a2;
    v14 = v71;
    v106 = v14;
    v109 = v161;
    v110 = v148;
    v111 = v152;
    v62 = (NSDictionary *)v78;
    v107 = v62;
    v112 = v160;
    v15 = objc_retainBlock(v105);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_1000733BC;
    v96[3] = &unk_100278FD8;
    v98 = v154;
    v99 = v160;
    SEL v104 = a2;
    v16 = v14;
    v97 = v16;
    v100 = v163;
    v101 = v161;
    v102 = v150;
    v103 = v148;
    v17 = objc_retainBlock(v96);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472;
    v88[2] = sub_100073440;
    v88[3] = &unk_100279000;
    v90 = v148;
    SEL v95 = a2;
    v74 = v16;
    v89 = v74;
    v91 = v163;
    v92 = v158;
    v93 = v161;
    v94 = v156;
    v18 = objc_retainBlock(v88);
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000734C0;
    v85[3] = &unk_100279028;
    v87 = v147;
    v73 = v17;
    id v86 = v73;
    v19 = objc_retainBlock(v85);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1000734F8;
    v82[3] = &unk_100279050;
    v84 = v147;
    v72 = v18;
    id v83 = v72;
    v20 = objc_retainBlock(v82);
    uint64_t v21 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v21);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292C40);
    CFStringRef v184 = @"itemId";
    v22 = +[NSArray arrayWithObjects:&v184 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v22);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292C58);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292C70);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v23 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v23);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292C88);
    CFStringRef v183 = @"parentId";
    v24 = +[NSArray arrayWithObjects:&v183 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v24);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292CA0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292CB8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292CD0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292CE8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292D00);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292D18);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292D30);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292D48);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292D60);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292D78);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292D90);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292DA8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292DC0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292DD8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292DF0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292E08);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292E20);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292E38);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v25 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v25);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292E50);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292E68);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292E80);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292E98);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292EB0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292EC8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292EE0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292EF8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292F10);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292F28);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292F40);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292F58);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292F70);
    CFStringRef v182 = @"createDate";
    v26 = +[NSArray arrayWithObjects:&v182 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v26);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292F88);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292FA0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292FB8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100292FD0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100292FE8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293000);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293018);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293030);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293048);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293060);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293078);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293090);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002930A8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002930C0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002930D8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002930F0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293108);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293120);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293138);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293150);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293168);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293180);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293198);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002931B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002931C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002931E0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v27 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v27);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002931F8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293210);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293228);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293240);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293258);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293270);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293288);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002932A0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v28 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v28);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002932B8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002932D0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002932E8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293300);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293318);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293330);
    v13[2](v13);
    if (+[CPLPersonChange serverSupportsAssetSortOrder])
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293348);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293360);
      v13[2](v13);
    }
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293378);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293390);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002933A8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002933C0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002933D8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002933F0);
    v13[2](v13);
    if (+[CPLPersonChange serverSupportsDetectionType])
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293408);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293420);
      v13[2](v13);
    }
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293438);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293450);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v29 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v29);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293468);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293480);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293498);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002934B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002934C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002934E0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002934F8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293510);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293528);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293540);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293558);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293570);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293588);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002935A0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002935B8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002935D0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002935E8);
    CFStringRef v181 = @"createDate";
    v30 = +[NSArray arrayWithObjects:&v181 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v30);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293600);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293618);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293630);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293648);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293660);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293678);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293690);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002936A8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002936C0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002936D8);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v31 = objc_opt_class();
    ((void (*)(void *, uint64_t))v76[2])(v76, v31);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002936F0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293708);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293720);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293738);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293750);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293768);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293780);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293798);
    v13[2](v13);
    ((void (*)(void *, void *))v12[2])(v12, &__NSArray0__struct);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002937B0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002937C8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002937E0);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v32 = objc_opt_class();
    ((void (*)(void *, uint64_t))v70[2])(v70, v32);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8);
    ((void (*)(void *, _UNKNOWN **))v69[2])(v69, &off_1002937F8);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, void))v73[2])(v73, 0);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293810);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293828);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293840);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293858);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293870);
    CFStringRef v180 = @"originalCreationDate";
    v33 = +[NSArray arrayWithObjects:&v180 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v33);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293888);
    CFStringRef v179 = @"importDate";
    v34 = +[NSArray arrayWithObjects:&v179 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v34);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002938A0);
    CFStringRef v178 = @"importGroupId";
    v35 = +[NSArray arrayWithObjects:&v178 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v35);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002938B8);
    CFStringRef v177 = @"mediaMetaDataType";
    v36 = +[NSArray arrayWithObjects:&v177 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v36);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002938D0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002938E8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293900);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293918);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293930);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293948);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293960);
    CFStringRef v176 = @"originatingFingerprint";
    v37 = +[NSArray arrayWithObjects:&v176 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v37);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293978);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293990);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002939A8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002939C0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002939D8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002939F0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293A08);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293A20);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293A38);
    CFStringRef v175 = @"codec";
    v38 = +[NSArray arrayWithObjects:&v175 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v38);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293A50);
    v13[2](v13);
    ((void (*)(void *, void))v72[2])(v72, 0);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    uint64_t v39 = objc_opt_class();
    ((void (*)(void *, uint64_t))v70[2])(v70, v39);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8);
    ((void (*)(void *, _UNKNOWN **))v69[2])(v69, &off_100293A68);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 2);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293A80);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293A98);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293AB0);
    CFStringRef v174 = @"syndicationId";
    v40 = +[NSArray arrayWithObjects:&v174 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v40);

    v13[2](v13);
    if (+[CPLAssetChange serverSupportsSharedLibrarySharingState])
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293AC8);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293AE0);
      v13[2](v13);
    }
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293AF8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293B10);
    v13[2](v13);
    if (+[CPLAssetChange serverSupportsLastViewedDate])
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293B28);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293B40);
      v13[2](v13);
    }
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293B58);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293B70);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293B88);
    CFStringRef v173 = @"lastSharedDate";
    v41 = +[NSArray arrayWithObjects:&v173 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v41);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293BA0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293BB8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293BD0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293BE8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293C00);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293C18);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293C30);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293C48);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293C60);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293C78);
    v13[2](v13);
    ((void (*)(void *, void *))v12[2])(v12, &__NSArray0__struct);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293C90);
    v13[2](v13);
    ((void (*)(void *, uint64_t))v73[2])(v73, 1);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293CA8);
    v172[0] = @"assetDate";
    v172[1] = @"assetDateEnc";
    v42 = +[NSArray arrayWithObjects:v172 count:2];
    ((void (*)(void *, void *))v15[2])(v15, v42);

    v13[2](v13);
    ((void (*)(void *, uint64_t))v72[2])(v72, 1);
    ((void (*)(void *, void))v73[2])(v73, 0);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293CC0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293CD8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293CF0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293D08);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293D20);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293D38);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293D50);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293D68);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293D80);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293D98);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293DB0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293DC8);
    v13[2](v13);
    ((void (*)(void *, void))v72[2])(v72, 0);
    ((void (*)(void *, void))v73[2])(v73, 0);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293DE0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293DF8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293E10);
    CFStringRef v171 = @"addedDate";
    v43 = +[NSArray arrayWithObjects:&v171 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v43);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293E28);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293E40);
    v13[2](v13);
    if (+[CPLAssetChange serverSupportsDeletedByUserIdentifier])
    {
      ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293E58);
      ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293E70);
      v13[2](v13);
    }
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293E88);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293EA0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293EB8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293ED0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293EE8);
    CFStringRef v170 = @"burstId";
    v44 = +[NSArray arrayWithObjects:&v170 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v44);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293F00);
    CFStringRef v169 = @"mediaGroupId";
    v45 = +[NSArray arrayWithObjects:&v169 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v45);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293F18);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293F30);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293F48);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293F60);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293F78);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293F90);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293FA8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293FC0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100293FD8);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100293FF0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294008);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294020);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294038);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294050);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294068);
    CFStringRef v168 = @"timeZoneOffset";
    v46 = +[NSArray arrayWithObjects:&v168 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v46);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294080);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294098);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002940B0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002940C8);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002940E0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002940F8);
    v13[2](v13);
    ((void (*)(void *, void))v72[2])(v72, 0);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 8);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294110);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294128);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294140);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294158);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294170);
    v167[0] = @"duration";
    v167[1] = @"durationEnc";
    v47 = +[NSArray arrayWithObjects:v167 count:2];
    ((void (*)(void *, void *))v15[2])(v15, v47);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294188);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002941A0);
    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002941B8);
    CFStringRef v166 = @"adjustedMediaMetaDataStrType";
    v48 = +[NSArray arrayWithObjects:&v166 count:1];
    ((void (*)(void *, void *))v15[2])(v15, v48);

    v13[2](v13);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_1002941D0);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_1002941E8);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *, uint64_t))v19[2])(v19, 32);
    ((void (*)(void *, _UNKNOWN **))v12[2])(v12, &off_100294200);
    ((void (*)(void *, _UNKNOWN **))v15[2])(v15, &off_100294218);
    v13[2](v13);
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void))v77[2])();
    allPrivateProperties = v74->_allPrivateProperties;
    v74->_allPrivateProperties = v68;
    v81 = v68;

    allPrivateCKKeys = v74->_allPrivateCKKeys;
    v74->_allPrivateCKKeys = v67;
    v79 = v67;

    propertiesKeysPairings = v74->_propertiesKeysPairings;
    v74->_propertiesKeysPairings = v66;
    v75 = v66;

    allSharedProperties = v74->_allSharedProperties;
    v74->_allSharedProperties = v65;
    v53 = v65;

    allSharedAndPrivateCKKeys = v74->_allSharedAndPrivateCKKeys;
    v74->_allSharedAndPrivateCKKeys = v62;
    v55 = v62;

    allSharedCKKeys = v74->_allSharedCKKeys;
    v74->_allSharedCKKeys = v63;
    v57 = v63;

    allResourcesCKKeys = v74->_allResourcesCKKeys;
    v74->_allResourcesCKKeys = v64;
    v59 = v64;

    _Block_object_dispose(v143, 8);
    _Block_object_dispose(v145, 8);

    _Block_object_dispose(v147, 8);
    _Block_object_dispose(v148, 8);
    _Block_object_dispose(v150, 8);

    _Block_object_dispose(v152, 8);
    _Block_object_dispose(v154, 8);

    _Block_object_dispose(v156, 8);
    _Block_object_dispose(v158, 8);

    _Block_object_dispose(v160, 8);
    _Block_object_dispose(v161, 8);

    _Block_object_dispose(v163, 8);
  }
  return v71;
}

- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forProperty:(id)a5
{
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_propertiesKeysPairings;
  id v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasProperty:", v8, (void)v17))
        {
          *a3 = [v14 properties];
          *a4 = [v14 ckKeys];
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      id v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)getPairedProperties:(id *)a3 andCKKeys:(id *)a4 forCKKey:(id)a5
{
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_propertiesKeysPairings;
  id v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasCKKey:", v8, (void)v17))
        {
          *a3 = [v14 properties];
          *a4 = [v14 ckKeys];
          BOOL v15 = 1;
          goto LABEL_11;
        }
      }
      id v11 = [(NSDictionary *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_11:

  return v15;
}

- (id)allTranslatedPropertiesForClass:(Class)a3
{
  uint64_t v6 = -[NSDictionary objectForKeyedSubscript:](self->_allPrivateProperties, "objectForKeyedSubscript:");
  if (!v6) {
    sub_1001CBAF8((uint64_t)a3, (uint64_t)a2, (uint64_t)self);
  }
  id v7 = (void *)v6;
  id v8 = [(NSDictionary *)self->_allSharedProperties objectForKeyedSubscript:a3];
  if ([v8 count])
  {
    id v9 = [v7 mutableCopy];
    [v9 unionSet:v8];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (BOOL)shouldUpdatePropertyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  allPrivateProperties = self->_allPrivateProperties;
  id v6 = a3;
  id v7 = [(NSDictionary *)allPrivateProperties objectForKeyedSubscript:a4];
  LOBYTE(allPrivateProperties) = [v7 containsObject:v6];

  return (char)allPrivateProperties;
}

- (BOOL)shouldUpdatePropertyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  allSharedProperties = self->_allSharedProperties;
  id v6 = a3;
  id v7 = [(NSDictionary *)allSharedProperties objectForKeyedSubscript:a4];
  LOBYTE(allSharedProperties) = [v7 containsObject:v6];

  return (char)allSharedProperties;
}

- (BOOL)isKeyReadOnly:(id)a3 recordClass:(Class)a4
{
  uint64_t v4 = qword_1002CE780;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_1002CE780, &stru_100279070);
  }
  unsigned __int8 v6 = [(id)qword_1002CE778 containsObject:v5];

  return v6;
}

- (BOOL)doesRecordClassSupportSparseRecords:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)shouldSplitIndirectRecordForKey:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class() == a4
    || [(CPLCKRecordPropertyMapping *)self shouldUpdateKeyOnBothRecords:v6 recordClass:a4])
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(CPLCKRecordPropertyMapping *)self shouldUpdateKeyOnPrivateRecord:v6 recordClass:a4];
  }

  return v7;
}

- (BOOL)shouldUpdateKeyOnBothRecords:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class() == a4
    || ([(NSDictionary *)self->_allSharedAndPrivateCKKeys objectForKeyedSubscript:a4],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 containsObject:v6],
        v7,
        (v8 & 1) != 0))
  {
    unsigned __int8 v9 = 1;
  }
  else
  {
    id v10 = sub_10006FEA8();
    unsigned __int8 v9 = [v10 containsObject:v6];
  }
  return v9;
}

- (BOOL)shouldUpdateKeyOnPrivateRecord:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ([(CPLCKRecordPropertyMapping *)self shouldUpdateKeyOnBothRecords:v6 recordClass:a4])
  {
    unsigned __int8 v7 = 1;
  }
  else
  {
    unsigned __int8 v8 = [(NSDictionary *)self->_allPrivateCKKeys objectForKeyedSubscript:a4];
    unsigned __int8 v7 = [v8 containsObject:v6];
  }
  return v7;
}

- (BOOL)shouldUpdateKeyOnSharedRecord:(id)a3 recordClass:(Class)a4
{
  id v6 = a3;
  if ((Class)objc_opt_class() == a4)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    unsigned __int8 v7 = [(NSDictionary *)self->_allSharedCKKeys objectForKeyedSubscript:a4];
    if ([v7 containsObject:v6])
    {
      unsigned __int8 v8 = 1;
    }
    else
    {
      unsigned __int8 v9 = [(NSDictionary *)self->_allResourcesCKKeys objectForKeyedSubscript:a4];
      if ([v9 containsObject:v6])
      {
        unsigned __int8 v8 = 1;
      }
      else
      {
        id v10 = sub_10006FEA8();
        unsigned __int8 v8 = [v10 containsObject:v6];
      }
    }
  }
  return v8;
}

- (NSDictionary)allPrivateProperties
{
  return self->_allPrivateProperties;
}

- (NSDictionary)allPrivateCKKeys
{
  return self->_allPrivateCKKeys;
}

- (NSDictionary)allResourcesCKKeys
{
  return self->_allResourcesCKKeys;
}

- (NSDictionary)propertiesKeysPairings
{
  return self->_propertiesKeysPairings;
}

- (NSDictionary)allSharedProperties
{
  return self->_allSharedProperties;
}

- (NSDictionary)allSharedCKKeys
{
  return self->_allSharedCKKeys;
}

- (NSDictionary)allSharedAndPrivateCKKeys
{
  return self->_allSharedAndPrivateCKKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSharedAndPrivateCKKeys, 0);
  objc_storeStrong((id *)&self->_allSharedCKKeys, 0);
  objc_storeStrong((id *)&self->_allSharedProperties, 0);
  objc_storeStrong((id *)&self->_propertiesKeysPairings, 0);
  objc_storeStrong((id *)&self->_allResourcesCKKeys, 0);
  objc_storeStrong((id *)&self->_allPrivateCKKeys, 0);
  objc_storeStrong((id *)&self->_allPrivateProperties, 0);
}

@end