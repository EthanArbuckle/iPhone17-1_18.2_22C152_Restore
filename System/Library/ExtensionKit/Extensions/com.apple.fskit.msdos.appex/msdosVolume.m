@interface msdosVolume
- (BOOL)isChownRestricted;
- (BOOL)isOffsetInMetadataZone:(unint64_t)a3;
- (BOOL)isVolumeDirty;
- (BOOL)truncatesLongNames;
- (FSOperations)fsOps;
- (id)createDirItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 isRoot:(BOOL)a7;
- (id)createFileItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6;
- (id)createRootDirItem;
- (id)createSymlinkItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 symlinkLength:(unsigned __int16)a7;
- (id)supportedXattrNamesForItem:(id)a3;
- (id)sync;
- (id)updateLabelInBootSector:(char)a3[11] toName:(char)a4[11];
- (id)verifyFileSize:(unint64_t)a3;
- (int)PC_CASE_PRESERVING;
- (int)PC_CASE_SENSITIVE;
- (int)ScanBootSector;
- (int)maxFileSizeInBits;
- (int)maxLinkCount;
- (int)maxNameLength;
- (msdosVolume)initWithResource:(id)a3 volumeID:(id)a4 volumeName:(id)a5;
- (unsigned)type;
- (void)FatMount:(id)a3 replyHandler:(id)a4;
- (void)calcNumOfDirEntriesForName:(unistr255 *)a3 replyHandler:(id)a4;
- (void)getXattrNamed:(id)a3 ofItem:(id)a4 replyHandler:(id)a5;
- (void)listXattrsOfItem:(id)a3 replyHandler:(id)a4;
- (void)nameToUnistr:(id)a3 flags:(unsigned int)a4 replyHandler:(id)a5;
- (void)setFsOps:(id)a3;
- (void)setIsVolumeDirty:(BOOL)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setVolumeLabel:(id)a3 rootDir:(id)a4 replyHandler:(id)a5;
- (void)setXattrNamed:(id)a3 toData:(id)a4 onItem:(id)a5 policy:(unint64_t)a6 replyHandler:(id)a7;
@end

@implementation msdosVolume

- (msdosVolume)initWithResource:(id)a3 volumeID:(id)a4 volumeName:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)msdosVolume;
  v5 = [(FATVolume *)&v9 initWithResource:a3 volumeID:a4 volumeName:a5];
  if (v5)
  {
    v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Hello MSDOS volume", v8, 2u);
    }
  }
  return v5;
}

- (int)ScanBootSector
{
  v3 = [(FATVolume *)self resource];
  unsigned int v4 = [v3 blockSize];

  id v5 = [objc_alloc((Class)NSMutableData) initWithLength:v4];
  v6 = [(FATVolume *)self resource];
  id v7 = v5;
  v8 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v6, [v7 mutableBytes], 0, v4);

  if (!v8)
  {
    v10 = (unsigned __int8 *)[v7 bytes];
    uint64_t v11 = (uint64_t)v10;
    if ((*v10 | 2) != 0xEB)
    {
      v47 = fskit_std_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_100031B88();
      }
      goto LABEL_32;
    }
    if (v10[510] != 85 || v10[511] != 170)
    {
      v12 = fskit_std_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100032780((unsigned __int8 *)(v11 + 510), v11, v12);
      }
    }
    uint64_t v13 = *(unsigned __int16 *)(v11 + 11);
    v14 = [(FATVolume *)self systemInfo];
    [v14 setBytesPerSector:v13];

    v15 = [(FATVolume *)self systemInfo];
    uint64_t v225 = v11;
    v16 = (unsigned __int8 *)(v11 + 13);
    uint64_t v17 = [v15 bytesPerSector] * *(unsigned __int8 *)(v11 + 13);
    v18 = [(FATVolume *)self systemInfo];
    [v18 setBytesPerCluster:v17];

    v19 = [(FATVolume *)self systemInfo];
    uint64_t v20 = [v19 bytesPerSector];
    v21 = [(FATVolume *)self systemInfo];
    [v21 setDirBlockSize:v20];

    int v22 = *(unsigned __int16 *)(v11 + 14);
    uint64_t v23 = *((unsigned __int16 *)v16 + 2);
    v24 = [(FATVolume *)self systemInfo];
    LODWORD(v20) = [v24 bytesPerSector];

    if (v20 != v4)
    {
      v48 = fskit_std_log();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        sub_1000326C8();
      }
      goto LABEL_25;
    }
    int v25 = *v16;
    if ((v25 & (v25 - 1)) != 0 || v25 == 0)
    {
      v47 = fskit_std_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_100032644();
      }
      goto LABEL_32;
    }
    unsigned int v27 = *(unsigned __int16 *)(v225 + 19);
    if (!*(_WORD *)(v225 + 19))
    {
      unsigned int v27 = *(_DWORD *)(v225 + 32);
      if (!v27)
      {
        if (*(unsigned char *)(v225 + 66) == 66 && *(void *)(v225 + 656))
        {
          v59 = fskit_std_log();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_100031C84(v59, v60, v61, v62, v63, v64, v65, v66);
          }
        }
        v47 = fskit_std_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100031C0C(v47, v67, v68, v69, v70, v71, v72, v73);
        }
        goto LABEL_32;
      }
    }
    unsigned int v28 = *(unsigned __int16 *)(v225 + 22);
    if (!*(_WORD *)(v225 + 22))
    {
      unsigned int v28 = *(_DWORD *)(v225 + 36);
      if (!v28)
      {
        v47 = fskit_std_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_100031CFC(v47, v74, v75, v76, v77, v78, v79, v80);
        }
        goto LABEL_32;
      }
    }
    unsigned int v222 = v28;
    uint64_t v29 = v22 + v28 * *(unsigned __int8 *)(v225 + 16);
    [(FATVolume *)self systemInfo];
    v31 = uint64_t v30 = v23;
    [v31 setRootSector:v29];

    int v221 = v30;
    v32 = [(FATVolume *)self systemInfo];
    [v32 setRootDirSize:((unint64_t)v4 + 32 * v30 - 1) / v4];

    v33 = [(FATVolume *)self systemInfo];
    LODWORD(v32) = [v33 rootSector];
    [(FATVolume *)self systemInfo];
    v34 = unsigned int v224 = v27;
    uint64_t v35 = [v34 rootDirSize] + v32;
    v36 = [(FATVolume *)self systemInfo];
    [v36 setFirstClusterOffset:v35];

    v37 = [(FATVolume *)self systemInfo];
    LODWORD(v34) = [v37 rootSector];
    v38 = [(FATVolume *)self systemInfo];
    uint64_t v39 = [v38 bytesPerSector] * v34;
    v40 = [(FATVolume *)self systemInfo];
    [v40 setMetaDataZoneSize:v39];

    v41 = [(FATVolume *)self systemInfo];
    unint64_t v42 = [v41 bytesPerCluster];
    v43 = [(FATVolume *)self systemInfo];
    uint64_t v44 = 2 * (v42 / (unint64_t)[v43 dirBlockSize]);
    v45 = [(FATVolume *)self systemInfo];
    [v45 setFirstDirBlockNum:v44];

    if (v222 > v224) {
      goto LABEL_30;
    }
    v46 = [(FATVolume *)self systemInfo];
    if ([v46 rootSector] < v222)
    {

      goto LABEL_30;
    }
    v49 = [(FATVolume *)self systemInfo];
    unsigned int v50 = [v49 firstClusterOffset] + *v16;

    if (v50 > v224)
    {
LABEL_30:
      v47 = fskit_std_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        sub_100031D74(v47, v51, v52, v53, v54, v55, v56, v57);
      }
LABEL_32:

      goto LABEL_33;
    }
    v81 = [(FATVolume *)self systemInfo];
    uint64_t v82 = (v224 - [v81 firstClusterOffset]) / *v16 + 1;
    v83 = [(FATVolume *)self systemInfo];
    [v83 setMaxValidCluster:v82];

    unsigned int v84 = v222 * v4;
    v85 = [(FATVolume *)self systemInfo];
    [v85 setFsInfoSectorNumber:0];

    v86 = [(FATVolume *)self systemInfo];
    id v87 = [v86 maxValidCluster];

    v88 = [(FATVolume *)self systemInfo];
    v89 = v88;
    uint64_t v223 = v222 * v4;
    if ((unint64_t)v87 > 0xFF5)
    {
      id v95 = [v88 maxValidCluster];

      v96 = [(FATVolume *)self systemInfo];
      v97 = v96;
      if ((unint64_t)v95 > 0xFFF5)
      {
        id v102 = [v96 maxValidCluster];

        if ((unint64_t)v102 > 0xFFFFFF5)
        {
          v48 = fskit_std_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_1000325A0(self);
          }
          goto LABEL_25;
        }
        v103 = [(FATVolume *)self systemInfo];
        [v103 setFATMask:0xFFFFFFFLL];

        v104 = [(FATVolume *)self systemInfo];
        [v104 setType:2];

        v105 = [(FATVolume *)self systemInfo];
        [v105 setFsSubTypeName:@"fat32"];

        v106 = +[NSNumber numberWithInt:2];
        v107 = [(FATVolume *)self systemInfo];
        [v107 setFsSubTypeNum:v106];

        unsigned int v94 = v84 >> 2;
        uint64_t v108 = *(unsigned int *)(v225 + 44);
        v109 = [(FATVolume *)self systemInfo];
        [v109 setRootFirstCluster:v108];

        uint64_t v110 = *(unsigned __int16 *)(v225 + 48);
        v111 = [(FATVolume *)self systemInfo];
        [v111 setFsInfoSectorNumber:v110];
      }
      else
      {
        [v96 setFATMask:0xFFFFLL];

        v98 = [(FATVolume *)self systemInfo];
        [v98 setType:1];

        v99 = [(FATVolume *)self systemInfo];
        [v99 setFsSubTypeName:@"fat16"];

        v100 = +[NSNumber numberWithInt:1];
        v101 = [(FATVolume *)self systemInfo];
        [v101 setFsSubTypeNum:v100];

        unsigned int v94 = v84 >> 1;
      }
    }
    else
    {
      [v88 setFATMask:4095];

      v90 = [(FATVolume *)self systemInfo];
      [v90 setType:0];

      v91 = [(FATVolume *)self systemInfo];
      [v91 setFsSubTypeName:@"fat12"];

      v92 = +[NSNumber numberWithInt:0];
      v93 = [(FATVolume *)self systemInfo];
      [v93 setFsSubTypeNum:v92];

      unsigned int v94 = 2 * v84 / 3;
    }
    v112 = [(FATVolume *)self systemInfo];
    id v113 = [v112 maxValidCluster];

    if ((unint64_t)v113 >= v94)
    {
      v114 = fskit_std_log();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG)) {
        sub_100032504();
      }

      v115 = [(FATVolume *)self systemInfo];
      [v115 setMaxValidCluster:v94 - 1];
    }
    v116 = [(FATVolume *)self resource];
    id v117 = [v116 blockCount];

    if ((unint64_t)v117 < v224)
    {
      v118 = [(FATVolume *)self systemInfo];
      unint64_t v119 = [v118 firstClusterOffset] + *v16;
      v120 = [(FATVolume *)self resource];
      id v121 = [v120 blockCount];

      if ((unint64_t)v121 < v119)
      {
        v48 = fskit_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100031DEC(self);
        }
LABEL_25:

LABEL_33:
        int v9 = 22;
        goto LABEL_34;
      }
      v122 = [(FATVolume *)self resource];
      id v123 = [v122 blockCount];
      v124 = [(FATVolume *)self systemInfo];
      unint64_t v125 = (((unint64_t)v123 - [v124 firstClusterOffset]) / *v16)
           + 1;

      v126 = [(FATVolume *)self systemInfo];
      id v127 = [v126 maxValidCluster];

      v128 = fskit_std_log();
      BOOL v129 = os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG);
      if ((unint64_t)v127 <= v125)
      {
        if (v129) {
          sub_100032468();
        }
      }
      else
      {
        if (v129)
        {
          v218 = [(FATVolume *)self resource];
          id v219 = [v218 blockCount];
          v220 = [(FATVolume *)self systemInfo];
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[msdosVolume ScanBootSector]";
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v219;
          __int16 v227 = 1024;
          unsigned int v228 = v224;
          __int16 v229 = 1024;
          int v230 = v125;
          __int16 v231 = 2048;
          id v232 = [v220 maxValidCluster];
          _os_log_debug_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEBUG, "%s: device sector count (%llu) us less than volume sector count (%u), limiting max cluster to %u (was %llu)", buf, 0x2Cu);
        }
        v128 = [(FATVolume *)self systemInfo];
        [v128 setMaxValidCluster:v125];
      }
    }
    uint64_t v130 = v225;
    uint64_t v131 = v4 * *(unsigned __int16 *)(v225 + 14);
    v132 = [(FATVolume *)self systemInfo];
    [v132 setFatOffset:v131];

    v133 = [(FATVolume *)self systemInfo];
    [v133 setFatSize:v223];

    uint64_t v134 = *(unsigned __int8 *)(v225 + 16);
    v135 = [(FATVolume *)self systemInfo];
    [v135 setNumOfFATs:v134];

    v136 = [(FATVolume *)self systemInfo];
    LODWORD(v135) = [v136 FATMask];

    uint64_t v137 = v225 + 64;
    if (v135 != 0xFFFFFFF) {
      uint64_t v137 = v225 + 36;
    }
    if (*(unsigned char *)(v137 + 2) == 41)
    {
      uint64_t v138 = *(unsigned int *)(v137 + 3);
      v139 = [(FATVolume *)self systemInfo];
      [v139 setSerialNumber:v138];

      v140 = [(FATVolume *)self systemInfo];
      [v140 setSerialNumberExists:1];

      v141 = [(FATVolume *)self systemInfo];
      LODWORD(v139) = [v141 serialNumber];

      if (v139)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        id v142 = objc_alloc((Class)FSVolumeIdentifier);
        id v143 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:buf];
        id v144 = [v142 initWithUUID:v143];
        v145 = [(FATVolume *)self systemInfo];
        [v145 setUuid:v144];

        v146 = [(FATVolume *)self systemInfo];
        [v146 setUuidExists:1];
      }
    }
    v147 = [(FATVolume *)self systemInfo];
    unsigned int v148 = [v147 fsInfoSectorNumber];

    int v149 = v221;
    if (!v148)
    {
LABEL_85:
      v172 = [(FATVolume *)self systemInfo];
      unsigned int v173 = [v172 type];

      if (v173 == 2)
      {
        uint64_t v174 = *(unsigned int *)(v130 + 44);
        v175 = [(FATVolume *)self systemInfo];
        [v175 setRootFirstCluster:v174];

        v176 = [(FATVolume *)self systemInfo];
        v177 = [(FATVolume *)self systemInfo];
        unsigned __int8 v178 = objc_msgSend(v176, "isClusterValid:", objc_msgSend(v177, "rootFirstCluster"));

        if ((v178 & 1) == 0)
        {
          v179 = fskit_std_log();
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR)) {
            sub_10003206C(self);
          }
        }
        if (v149)
        {
          v47 = fskit_std_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100031FF4(v47, v180, v181, v182, v183, v184, v185, v186);
          }
          goto LABEL_32;
        }
        if (*(_WORD *)(v130 + 42))
        {
          v47 = fskit_std_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100031F7C(v47, v189, v190, v191, v192, v193, v194, v195);
          }
          goto LABEL_32;
        }
        if (*(_WORD *)(v130 + 19))
        {
          v47 = fskit_std_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100031F04(v47, v196, v197, v198, v199, v200, v201, v202);
          }
          goto LABEL_32;
        }
        if (*(_WORD *)(v130 + 22))
        {
          v47 = fskit_std_log();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            sub_100031E8C(v47, v211, v212, v213, v214, v215, v216, v217);
          }
          goto LABEL_32;
        }
      }
      else
      {
        if (!v149)
        {
          v48 = fskit_std_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_100032154(self);
          }
          goto LABEL_25;
        }
        if (!HIWORD(v224) && !*(_WORD *)(v130 + 19))
        {
          v187 = fskit_std_log();
          if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG)) {
            sub_1000322B0();
          }
        }
        if (!*(_WORD *)(v130 + 22))
        {
          v188 = fskit_std_log();
          if (os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG)) {
            sub_100032200(self, v188);
          }
        }
      }
      int v9 = 0;
      goto LABEL_34;
    }
    id v150 = [objc_alloc((Class)NSMutableData) initWithLength:v4];
    v151 = [(FATVolume *)self systemInfo];
    [v151 setFsInfoSector:v150];

    v152 = [(FATVolume *)self resource];
    v153 = [(FATVolume *)self systemInfo];
    id v154 = [v153 fsInfoSector];
    id v155 = [v154 mutableBytes];
    v156 = [(FATVolume *)self systemInfo];
    v157 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v152, v155, [v156 fsInfoSectorNumber] * v4, v4);

    if (v157)
    {
      v158 = fskit_std_log();
      if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR)) {
        sub_1000323F4();
      }

      v159 = [(FATVolume *)self systemInfo];
      [v159 setFsInfoSectorNumber:0];
    }
    v160 = [(FATVolume *)self systemInfo];
    id v161 = [v160 fsInfoSector];
    v162 = [v161 mutableBytes];

    uint64_t v130 = v225;
    int v149 = v221;
    if (*v162 == 1096897106 && v162[121] == 1631679090 && v162[127] == -1437270016)
    {
      uint64_t v203 = v162[122];
      v204 = [(FATVolume *)self systemInfo];
      [v204 setFreeClusters:v203];

      uint64_t v205 = v162[123];
      v206 = [(FATVolume *)self systemInfo];
      [v206 setFirstFreeCluster:v205];

      v207 = [(FATVolume *)self systemInfo];
      v208 = (char *)[v207 freeClusters];
      v209 = [(FATVolume *)self systemInfo];
      v210 = (char *)[v209 maxValidCluster] - 1;

      if (v208 <= v210) {
        goto LABEL_84;
      }
    }
    else
    {
      v163 = fskit_std_log();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
        sub_10003237C(v163, v164, v165, v166, v167, v168, v169, v170);
      }
    }
    v171 = [(FATVolume *)self systemInfo];
    [v171 setFsInfoSectorNumber:0];

LABEL_84:
    goto LABEL_85;
  }
  int v9 = [v8 code];
LABEL_34:

  return v9;
}

- (id)createRootDirItem
{
  v3 = [MsdosDirItem alloc];
  unsigned int v4 = [(FATVolume *)self systemInfo];
  id v5 = [v4 rootFirstCluster];
  id v6 = [objc_alloc((Class)NSString) initWithUTF8String:&unk_100040719];
  id v7 = [(MsdosDirItem *)v3 initInVolume:self inDir:0 startingAt:v5 withData:0 andName:v6 isRoot:1];

  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100028A1C;
    v9[3] = &unk_10004D258;
    id v10 = v7;
    [v10 iterateFromOffset:0 options:0 replyHandler:v9];
  }

  return v7;
}

- (int)PC_CASE_PRESERVING
{
  return 1;
}

- (int)PC_CASE_SENSITIVE
{
  return 0;
}

- (BOOL)isChownRestricted
{
  return 0;
}

- (int)maxFileSizeInBits
{
  return 33;
}

- (int)maxLinkCount
{
  return 1;
}

- (int)maxNameLength
{
  return 255;
}

- (BOOL)truncatesLongNames
{
  return 0;
}

- (id)supportedXattrNamesForItem:(id)a3
{
  v3 = +[FATItem dynamicCast:a3];
  unsigned int v4 = v3;
  if (v3 && [v3 isRoot])
  {
    id v5 = +[FSFileName nameWithString:@"com.apple.filesystems.msdosfs.volume_id"];
    v8 = v5;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)getXattrNamed:(id)a3 ofItem:(id)a4 replyHandler:(id)a5
{
  id v20 = a3;
  v8 = (void (**)(id, id, void))a5;
  int v9 = +[FATItem dynamicCast:a4];
  id v10 = v9;
  if (v9 && [v9 isRoot])
  {
    uint64_t v11 = [v20 data];
    if ([v11 length] == (id)39)
    {
      id v12 = [v20 data];
      int v13 = memcmp([v12 bytes], "com.apple.filesystems.msdosfs.volume_id", 0x27uLL);

      if (!v13)
      {
        v14 = [(FATVolume *)self systemInfo];
        unsigned __int8 v15 = [v14 serialNumberExists];

        if (v15)
        {
          id v16 = +[NSMutableData dataWithLength:4];
          uint64_t v17 = (unsigned int *)[v16 mutableBytes];
          v18 = [(FATVolume *)self systemInfo];
          unsigned int v19 = [v18 serialNumber];

          *uint64_t v17 = v19;
          v8[2](v8, v16, 0);
          goto LABEL_9;
        }
      }
    }
    else
    {
    }
  }
  fs_errorForPOSIXError();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, id, id))v8)[2](v8, 0, v16);
LABEL_9:
}

- (void)setXattrNamed:(id)a3 toData:(id)a4 onItem:(id)a5 policy:(unint64_t)a6 replyHandler:(id)a7
{
  id v15 = a3;
  int v9 = (void (**)(id, void *))a7;
  id v10 = +[FATItem dynamicCast:a5];
  uint64_t v11 = v10;
  if (v10 && [v10 isRoot])
  {
    id v12 = [v15 data];
    if ([v12 length] == (id)39)
    {
      id v13 = [v15 data];
      memcmp([v13 bytes], "com.apple.filesystems.msdosfs.volume_id", 0x27uLL);
    }
  }
  v14 = fs_errorForPOSIXError();
  v9[2](v9, v14);
}

- (void)listXattrsOfItem:(id)a3 replyHandler:(id)a4
{
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = +[FATItem dynamicCast:a3];
  v8 = v7;
  if (v7
    && [v7 isRoot]
    && ([(FATVolume *)self systemInfo],
        int v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v9 serialNumberExists],
        v9,
        v10))
  {
    uint64_t v11 = +[FSFileName nameWithString:@"com.apple.filesystems.msdosfs.volume_id"];
    id v13 = v11;
    id v12 = +[NSArray arrayWithObjects:&v13 count:1];
    v6[2](v6, v12, 0);
  }
  else
  {
    uint64_t v11 = fs_errorForPOSIXError();
    ((void (**)(id, void *, void *))v6)[2](v6, 0, v11);
  }
}

- (void)FatMount:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x3032000000;
  uint64_t v78 = sub_10002981C;
  uint64_t v79 = sub_10002982C;
  id v80 = 0;
  if (!malloc_type_calloc(1uLL, 0x28uLL, 0xB58AF6B0uLL))
  {
    id v15 = fs_errorForPOSIXError();
    v7[2](v7, 0, v15);
    id v16 = 0;
    goto LABEL_12;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v8 = v6;
  int v9 = 0;
  id v10 = [v8 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v72;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v72 != v11) {
          objc_enumerationMutation(v8);
        }
        v9 |= [*(id *)(*((void *)&v71 + 1) + 8 * i) containsString:@"rdonly"];
      }
      id v10 = [v8 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v10);
  }

  +[Utilities setGMTDiffOffset];
  id v13 = objc_alloc_init(FileSystemInfo);
  [(FATVolume *)self setSystemInfo:v13];

  v14 = [(FATVolume *)self systemInfo];
  [v14 setFsTypeName:@"msdos"];

  if (![(msdosVolume *)self ScanBootSector])
  {
    uint64_t v17 = [FSOperations alloc];
    v18 = [(FATVolume *)self systemInfo];
    unsigned int v19 = -[FSOperations initWithType:](v17, "initWithType:", [v18 type]);
    [(msdosVolume *)self setFsOps:v19];

    id v20 = [FATManager alloc];
    v21 = [(FATVolume *)self resource];
    int v22 = [(FATVolume *)self systemInfo];
    uint64_t v23 = [(msdosVolume *)self fsOps];
    v24 = [(FATManager *)v20 initWithDevice:v21 info:v22 ops:v23 usingCache:0];
    [(FATVolume *)self setFatManager:v24];

    int v25 = [(FATVolume *)self fatManager];
    LODWORD(v21) = v25 == 0;

    if (v21)
    {
      v33 = fskit_std_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_100032894(v33, v34, v35, v36, v37, v38, v39, v40);
      }

      id v15 = fs_errorForPOSIXError();
      v7[2](v7, 0, v15);
      id v16 = 0;
      goto LABEL_12;
    }
    v26 = [(FATVolume *)self systemInfo];
    BOOL v27 = [v26 type] == 0;

    if (!v27)
    {
      unsigned int v28 = [(FATVolume *)self fatManager];
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_100029834;
      v69[3] = &unk_10004D280;
      v69[4] = &v75;
      char v70 = v9 & 1;
      [v28 getDirtyBitValue:v69];
    }
    if (v76[5]) {
      goto LABEL_21;
    }
    uint64_t v29 = [(FATVolume *)self systemInfo];
    BOOL v30 = [v29 type] == 2;

    if (v30)
    {
      v31 = [(FATVolume *)self fatManager];
      v32 = [(FATVolume *)self systemInfo];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_100029914;
      v68[3] = &unk_10004D2A8;
      v68[4] = self;
      v68[5] = &v75;
      objc_msgSend(v31, "getContigClusterChainLengthStartingAt:replyHandler:", objc_msgSend(v32, "rootFirstCluster"), v68);
    }
    if (v76[5])
    {
LABEL_21:
      ((void (*)(void (**)(id, void, void *), void))v7[2])(v7, 0);
      id v16 = 0;
      goto LABEL_13;
    }
    v41 = [(msdosVolume *)self createRootDirItem];
    [(FATVolume *)self setRootItem:v41];

    unint64_t v42 = [(FATVolume *)self rootItem];
    LODWORD(v41) = v42 == 0;

    if (v41)
    {
      uint64_t v51 = fskit_std_log();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
        sub_10003290C(v51);
      }

      id v15 = fs_errorForPOSIXError();
      v7[2](v7, 0, v15);
      id v16 = 0;
      goto LABEL_12;
    }
    id v43 = objc_alloc((Class)NSMutableData);
    uint64_t v44 = [(FATVolume *)self systemInfo];
    id v45 = objc_msgSend(v43, "initWithLength:", objc_msgSend(v44, "bytesPerSector"));

    v46 = [(FATVolume *)self resource];
    id v16 = v45;
    id v47 = [v16 mutableBytes];
    v48 = [(FATVolume *)self systemInfo];
    uint64_t v49 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v46, v47, 0, [v48 bytesPerSector]);
    unsigned int v50 = (void *)v76[5];
    v76[5] = v49;

    if (v76[5])
    {
      ((void (*)(void (**)(id, void, void *), void))v7[2])(v7, 0);
      goto LABEL_13;
    }
    uint64_t v64 = [(FATVolume *)self resource];
    uint64_t v66 = [(FATVolume *)self systemInfo];
    unsigned __int16 v52 = (unsigned __int16)[v66 bytesPerSector];
    uint64_t v53 = [(FATVolume *)self systemInfo];
    unsigned int v54 = [v53 bytesPerCluster];
    uint64_t v55 = [(FATVolume *)self systemInfo];
    unsigned int v56 = [v55 bytesPerSector];
    id v16 = v16;
    uint64_t v57 = +[Utilities getVolumeName:bps:spc:bootsector:flags:](Utilities, "getVolumeName:bps:spc:bootsector:flags:", v64, v52, (v54 / v56), [v16 mutableBytes], 3);
    v58 = [(FATVolume *)self systemInfo];
    [v58 setVolumeLabel:v57];

    v59 = [(FATVolume *)self systemInfo];
    uint64_t v60 = [v59 volumeLabel];
    if (v60)
    {
      uint64_t v67 = [(FATVolume *)self systemInfo];
      id v61 = [v67 volumeLabel];
      if ([v61 UTF8String])
      {
        uint64_t v62 = [(FATVolume *)self systemInfo];
        id v63 = [v62 volumeLabel];
        BOOL v65 = *(unsigned char *)[v63 UTF8String] == 0;

        if (v65)
        {
LABEL_37:
          +[Utilities enableMetaRW];
          id v15 = [(FATVolume *)self rootItem];
          ((void (**)(id, void *, void *))v7)[2](v7, v15, 0);
          goto LABEL_12;
        }
        v59 = [(FATVolume *)self systemInfo];
        [v59 setVolumeLabelExists:1];
      }
      else
      {
      }
    }

    goto LABEL_37;
  }
  id v15 = fs_errorForPOSIXError();
  v7[2](v7, 0, v15);
  id v16 = 0;
LABEL_12:

LABEL_13:
  _Block_object_dispose(&v75, 8);
}

- (id)createDirItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 isRoot:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [[MsdosDirItem alloc] initInVolume:self inDir:v14 startingAt:v9 withData:v13 andName:v12 isRoot:v7];

  return v15;
}

- (id)createFileItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = [[MsdosFileItem alloc] initInVolume:self inDir:v12 startingAt:v7 withData:v11 andName:v10];

  return v13;
}

- (id)createSymlinkItemWithParent:(id)a3 firstCluster:(unsigned int)a4 dirEntryData:(id)a5 name:(id)a6 symlinkLength:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  uint64_t v9 = *(void *)&a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [(FATItem *)[SymLinkItem alloc] initInVolume:self inDir:v14 startingAt:v9 withData:v13 andName:v12 isRoot:0];

  if (v15) {
    [v15 setSymlinkLength:v7];
  }

  return v15;
}

- (void)calcNumOfDirEntriesForName:(unistr255 *)a3 replyHandler:(id)a4
{
  id v5 = (void (**)(id, void, uint64_t))a4;
  char v17 = 0;
  int v6 = msdosfs_unicode_to_dos_name(a3->var1, a3->var0, v18, &v17);
  if ((v6 - 2) < 2)
  {
    uint64_t v15 = msdosfs_winSlotCnt((uint64_t)a3->var1, a3->var0) + 1;
    v5[2](v5, 0, v15);
  }
  else if (v6 == 1)
  {
    v5[2](v5, 0, 1);
  }
  else
  {
    if (!v6)
    {
      uint64_t v7 = fskit_std_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100032AA0(v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
    id v16 = fs_errorForPOSIXError();
    ((void (**)(id, void *, uint64_t))v5)[2](v5, v16, 0);
  }
}

- (void)nameToUnistr:(id)a3 flags:(unsigned int)a4 replyHandler:(id)a5
{
  uint64_t v7 = a5;
  memset(__src, 0, sizeof(__src));
  id v8 = a3;
  uint64_t v9 = (unsigned __int8 *)[v8 UTF8String];
  id v10 = v8;
  uint64_t v11 = (const char *)[v10 UTF8String];

  size_t v12 = strlen(v11);
  int v13 = CONV_UTF8ToUnistr255(v9, v12, __src, a4);
  if (v13)
  {
    uint64_t v14 = fs_errorForPOSIXError();
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v15 = (void (*)(void *, void *, unsigned char *))v7[2];
  memcpy(v16, __src, sizeof(v16));
  v15(v7, v14, v16);
  if (v13) {
}
  }

- (id)verifyFileSize:(unint64_t)a3
{
  if (HIDWORD(a3))
  {
    unsigned int v4 = fs_errorForPOSIXError();
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4;
}

- (BOOL)isOffsetInMetadataZone:(unint64_t)a3
{
  unsigned int v4 = [(FATVolume *)self systemInfo];
  LOBYTE(a3) = (unint64_t)[v4 metaDataZoneSize] > a3;

  return a3;
}

- (id)sync
{
  uint64_t v3 = [(FATVolume *)self systemInfo];
  uint64_t v4 = [v3 fsInfoSector];
  if (!v4)
  {

    goto LABEL_7;
  }
  id v5 = (void *)v4;
  int v6 = [(FATVolume *)self systemInfo];
  unsigned int v7 = [v6 fsInfoSectorNumber];

  if (!v7) {
    goto LABEL_7;
  }
  id v8 = [(FATVolume *)self systemInfo];
  id v9 = [v8 fsInfoSector];
  id v10 = [v9 mutableBytes];

  unint64_t v11 = v10[122];
  LODWORD(v9) = v10[123];
  size_t v12 = [(FATVolume *)self systemInfo];
  if ([v12 firstFreeCluster] != v9)
  {

    goto LABEL_9;
  }
  int v13 = [(FATVolume *)self systemInfo];
  id v14 = [v13 freeClusters];

  if (v14 == (id)v11)
  {
LABEL_7:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
LABEL_9:
  id v16 = [(FATVolume *)self systemInfo];
  v10[122] = [v16 freeClusters];

  char v17 = [(FATVolume *)self systemInfo];
  v10[123] = [v17 firstFreeCluster];

  v18 = [(FATVolume *)self resource];
  unsigned int v19 = [(FATVolume *)self systemInfo];
  id v20 = [v19 fsInfoSector];
  id v21 = [v20 mutableBytes];
  int v22 = [(FATVolume *)self systemInfo];
  unsigned int v23 = [v22 fsInfoSectorNumber];
  v24 = [(FATVolume *)self systemInfo];
  uint64_t v25 = [v24 bytesPerSector] * v23;
  v26 = [(FATVolume *)self systemInfo];
  uint64_t v15 = +[Utilities metaWriteToDevice:from:startingAt:length:](Utilities, "metaWriteToDevice:from:startingAt:length:", v18, v21, v25, [v26 bytesPerSector]);

  if (v15)
  {
    BOOL v27 = fskit_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100032B18();
    }
  }
LABEL_13:

  return v15;
}

- (void)setVolumeLabel:(id)a3 rootDir:(id)a4 replyHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  if (CONV_LabelUTF8ToUTF16LocalEncoding((char *)[a3 bytes], v25))
  {
    uint64_t v10 = fs_errorForPOSIXError();
LABEL_4:
    size_t v12 = (void *)v10;
    goto LABEL_5;
  }
  unint64_t v11 = [(FATVolume *)self fatManager];
  [v11 setDirtyBitValue:1 replyHandler:&stru_10004D2C8];

  uint64_t v10 = [(msdosVolume *)self updateLabelInBootSector:v26 toName:v25];
  if (v10) {
    goto LABEL_4;
  }
  int v13 = [v8 entryData];

  if (!v13
    || ([v8 entryData],
        id v14 = objc_claimAutoreleasedReturnValue(),
        [v14 setName:v25],
        v14,
        [v8 flushDirEntryData],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    size_t v12 = +[Utilities getVolumeLabelFromBootSector:v25];
    v9[2](v9, v12, 0);
    goto LABEL_6;
  }
  size_t v12 = (void *)v15;
  id v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100032B8C(v16, v17, v18, v19, v20, v21, v22, v23);
  }

  id v24 = [(msdosVolume *)self updateLabelInBootSector:v25 toName:v26];
LABEL_5:
  ((void (**)(id, void *, void *))v9)[2](v9, 0, v12);
LABEL_6:
}

- (id)updateLabelInBootSector:(char)a3[11] toName:(char)a4[11]
{
  unsigned int v7 = [(FATVolume *)self systemInfo];
  unsigned int v8 = [v7 bytesPerSector];

  id v9 = [objc_alloc((Class)NSMutableData) initWithLength:v8];
  uint64_t v10 = [(FATVolume *)self resource];
  id v11 = v9;
  size_t v12 = +[Utilities syncMetaReadFromDevice:into:startingAt:length:](Utilities, "syncMetaReadFromDevice:into:startingAt:length:", v10, [v11 mutableBytes], 0, v8);

  if (!v12)
  {
    id v13 = v11;
    id v14 = (unsigned __int8 *)[v13 mutableBytes];
    uint64_t v15 = v14;
    if ((*v14 | 2) == 0xEB)
    {
      if (v14[510] != 85 || v14[511] != 170)
      {
        id v16 = fskit_std_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100032CF4(v15 + 510, (uint64_t)v15, v16);
        }
      }
      uint64_t v17 = [(FATVolume *)self systemInfo];
      unsigned int v18 = [v17 type];

      uint64_t v19 = v15 + 64;
      if (v18 != 2) {
        uint64_t v19 = v15 + 36;
      }
      if (v19[2] == 41)
      {
        uint64_t v20 = *(void *)(v19 + 7);
        *(_DWORD *)(a3 + 7) = *(_DWORD *)(v19 + 14);
        *(void *)a3 = v20;
        uint64_t v21 = *(void *)a4;
        *(_DWORD *)(v19 + 14) = *(_DWORD *)(a4 + 7);
        *(void *)(v19 + 7) = v21;
      }
      uint64_t v22 = [(FATVolume *)self resource];
      size_t v12 = +[Utilities metaWriteToDevice:from:startingAt:length:](Utilities, "metaWriteToDevice:from:startingAt:length:", v22, [v13 bytes], 0, v8);
    }
    else
    {
      uint64_t v23 = fskit_std_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100032C78(v15, v23);
      }

      size_t v12 = fs_errorForPOSIXError();
    }
  }

  return v12;
}

- (BOOL)isVolumeDirty
{
  return self->_isVolumeDirty;
}

- (void)setIsVolumeDirty:(BOOL)a3
{
  self->_isVolumeDirty = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (FSOperations)fsOps
{
  return (FSOperations *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFsOps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end