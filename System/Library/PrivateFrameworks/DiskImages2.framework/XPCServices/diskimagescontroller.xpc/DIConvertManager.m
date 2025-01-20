@interface DIConvertManager
- (BOOL)runWithError:(id *)a3;
- (BOOL)validateFormatsWithDiskImage:(void *)a3 error:(id *)a4;
- (DIBaseParams)outputParams;
- (DIConvertManager)initWithParams:(id)a3;
- (DIConvertParams)convertParams;
- (unique_ptr<DiskImage,)convertWithDiskImage:(void *)a3 error:(id *)a4;
- (void)convertUserDataWithDiskImage:(void *)a3 destination:(void *)a4;
- (void)dealloc;
- (void)setConvertParams:(id)a3;
- (void)setOutputParams:(id)a3;
@end

@implementation DIConvertManager

- (DIConvertManager)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIConvertManager;
  v6 = [(DIConvertManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_convertParams, a3);
  }

  return v7;
}

- (DIBaseParams)outputParams
{
  v3 = [(DIConvertManager *)self convertParams];
  if ([v3 inPlaceConversion])
  {
    v4 = [(DIConvertManager *)self convertParams];
  }
  else
  {
    id v5 = [(DIConvertManager *)self convertParams];
    v4 = [v5 outputParams];
  }
  return (DIBaseParams *)v4;
}

- (BOOL)validateFormatsWithDiskImage:(void *)a3 error:(id *)a4
{
  v7 = [(DIConvertManager *)self convertParams];
  unsigned int v8 = [v7 inPlaceConversion];

  if (!v8) {
    return 1;
  }
  objc_super v9 = [(DIConvertManager *)self convertParams];
  unsigned __int8 v10 = +[DIConvertParams isUDIFWithFormat:](DIConvertParams, "isUDIFWithFormat:", [v9 outputFormat]);

  if ((v10 & 1) == 0)
  {
    CFStringRef v13 = @"In-place conversion to this image format is not supported";
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_13;
  }
  if (!v11)
  {
    if (v12 && !v12[152]) {
      goto LABEL_6;
    }
LABEL_13:
    CFStringRef v13 = @"In-place conversion from this image format is not supported";
    goto LABEL_14;
  }
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  if (v12[153])
  {
LABEL_7:
    {
      CFStringRef v13 = @"Cannot convert in-place with a shadow file";
LABEL_14:
      return +[DIError failWithPOSIXCode:22 description:v13 error:a4];
    }
    return 1;
  }
  return +[DIError failWithPOSIXCode:22 verboseInfo:@"Cannot convert this image in-place, as it contains unordered UDIF runs" error:a4];
}

- (unique_ptr<DiskImage,)convertWithDiskImage:(void *)a3 error:(id *)a4
{
  v135 = v4;
  *(void *)&long long v228 = sub_10006DC94(*(uint64_t (****)(void))a3);
  *((void *)&v228 + 1) = v7;
  if (!((unint64_t)v228 | v7))
  {
    *(void *)&long long v228 = sub_10014B80C();
    *((void *)&v228 + 1) = v8;
  }
  v136 = self;
  objc_super v9 = [(DIConvertManager *)self convertParams];
  unsigned int v10 = +[DIConvertParams isUDIFWithFormat:](DIConvertParams, "isUDIFWithFormat:", [v9 outputFormat]);

  if (v10)
  {
    v11 = [(DIConvertManager *)v136 outputParams];
    if ([v11 hasUnlockedBackend])
    {
      v12 = [(DIConvertManager *)v136 outputParams];
      CFStringRef v13 = v12;
      if (v12) {
        [v12 backend];
      }
      else {
        *(_OWORD *)v229 = 0uLL;
      }
      v39 = [(DIConvertManager *)v136 outputParams];
      v40 = [v39 diskImageParamsXPC];
      v200[0] = [v40 blockSize];
      sub_100029798((uint64_t)v229, v200, v165);
      long long v145 = v165[0];
      v165[0] = 0uLL;

      if (*(void *)&v229[8]) {
        sub_100004944(*(std::__shared_weak_count **)&v229[8]);
      }
    }
    else
    {
      v21 = [(DIConvertManager *)v136 outputParams];
      v22 = v21;
      if (v21) {
        [v21 backend];
      }
      else {
        long long v145 = 0uLL;
      }
    }
    sub_1000091B8(*(void *)a3, 1, 2, (uint64_t)v227);
    sub_1000133F8((uint64_t)v227, (uint64_t)"Could not get mapping information", (uint64_t)&v225);
    v41 = (uint64_t *)sub_1000092C4((uint64_t)&v225);
    sub_100014C40((uint64_t)&v221, v41);
    sub_100013494((uint64_t)&v221, (uint64_t)v143);
    sub_10010B464((uint64_t)v144, (uint64_t)v143);
    uint64_t v42 = v143[0];
    v143[0] = 0;
    if (v42) {
      (*(void (**)(uint64_t))(*(void *)v42 + 24))(v42);
    }
    sub_100013530((uint64_t)&v221, (uint64_t)v141);
    sub_10010B464((uint64_t)v142, (uint64_t)v141);
    uint64_t v43 = v141[0];
    v141[0] = 0;
    if (v43) {
      (*(void (**)(uint64_t))(*(void *)v43 + 24))(v43);
    }
    sub_1000135CC((uint64_t)v144, (uint64_t)v142, (uint64_t)v200);
    sub_1000135CC((uint64_t)v144, (uint64_t)v142, (uint64_t)&v198);
    sub_100009100((uint64_t)&v225, (uint64_t)v165);
    uint64_t v44 = sub_10000907C(v165, (uint64_t)"Could not get media info");
    uint64_t v45 = (*(uint64_t (**)(void))(**(void **)a3 + 32))();
    long long v146 = v145;
    if (*((void *)&v145 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v145 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    sub_100029910((uint64_t)v165, &v146, v45);
    *(void *)&v165[0] = off_10019E9F8;
    v167[0] = v200[0];
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    v167[1] = 850045863;
    uint64_t v171 = 0;
    int v172 = v203;
    v173 = v204;
    v174[0] = v205;
    v174[1] = v206;
    if (v206)
    {
      *(void *)(v205 + 16) = v174;
      v204 = &v205;
      uint64_t v205 = 0;
      uint64_t v206 = 0;
    }
    else
    {
      v173 = v174;
    }
    v174[2] = v207;
    long long v175 = v208;
    long long v176 = v209;
    int v177 = v210;
    uint64_t v46 = v211;
    uint64_t v207 = 0;
    uint64_t v211 = 0;
    uint64_t v178 = v46;
    long long v179 = v212;
    long long v180 = v213;
    int v181 = v214;
    uint64_t v47 = v215;
    uint64_t v215 = 0;
    uint64_t v182 = v47;
    long long v183 = v216;
    long long v184 = v217;
    int v185 = v218;
    uint64_t v186 = v219;
    char v187 = 0;
    char v188 = v220;
    v189 = v167;
    uint64_t v192 = 0;
    v191 = 0;
    v190 = &v191;
    v193[0] = 0;
    v194[1] = 0;
    v194[0] = 0;
    v193[1] = (unint64_t)v194;
    sub_100019E14(v195);
    v195[1] = 0;
    char v196 = 1;
    uint64_t v134 = v44;
    long long v197 = v228;
    v48 = *(void **)(v44 + 32);
    v137 = (void *)(v44 + 40);
    if (v48 == (void *)(v44 + 40))
    {
LABEL_144:
      if (sub_1000D8524())
      {
        *(void *)&long long v161 = "DIConvertManager::convertWithDiskImage:error:::ExecSchedulerItBinder::ExecutionSchedulerSortedConsecutiveItTransform, locks::Std>, locks::Std>::UDIFWritable(const MediaInfo::logical_disk_entities_map &, std::shared_ptr<Backend>, Checksum &&, uint64_t, const boost::uuids::uuid &) [Checksum = ChecksumScheduler<checksum::CRC32, DIConvertManager::convertWithDiskImage:error:::ExecSchedulerItBinder::ExecutionSchedulerSortedConsecutiveItTransform, locks::Std>, LockingPolicy = locks::Std]";
        *((void *)&v161 + 1) = 156;
        LODWORD(v162) = 2;
        sub_10002996C(v229, &v161);
        v96 = (uint64_t *)v190;
        if (v190 != &v191)
        {
          do
          {
            v97 = (void *)std::ostream::operator<<();
            sub_1000039A0(v97, (uint64_t)" - ", 3);
            v98 = (void *)std::ostream::operator<<();
            v99 = sub_1000039A0(v98, (uint64_t)" -> ", 4);
            v100 = sub_100029F60(v99, v96[7]);
            std::ios_base::getloc((const std::ios_base *)((char *)v100 + *(void *)(*v100 - 24)));
            v101 = std::locale::use_facet(v139, &std::ctype<char>::id);
            ((void (*)(const std::locale::facet *, uint64_t))v101->__vftable[2].~facet_0)(v101, 10);
            std::locale::~locale(v139);
            std::ostream::put();
            std::ostream::flush();
            v102 = (uint64_t *)v96[1];
            if (v102)
            {
              do
              {
                v103 = (uint64_t **)v102;
                v102 = (uint64_t *)*v102;
              }
              while (v102);
            }
            else
            {
              do
              {
                v103 = (uint64_t **)v96[2];
                BOOL v82 = *v103 == v96;
                v96 = (uint64_t *)v103;
              }
              while (!v82);
            }
            v96 = (uint64_t *)v103;
          }
          while (v103 != &v191);
        }
        std::ostream::~ostream();
        sub_10002A20C((uint64_t)v229);
        std::ios::~ios();
      }
      v104 = (void *)(v134 + 32);
      if (sub_1000D8524())
      {
        *(void *)&long long v161 = "DIConvertManager::convertWithDiskImage:error:::ExecSchedulerItBinder::ExecutionSchedulerSortedConsecutiveItTransform, locks::Std>, locks::Std>::UDIFWritable(const MediaInfo::logical_disk_entities_map &, std::shared_ptr<Backend>, Checksum &&, uint64_t, const boost::uuids::uuid &) [Checksum = ChecksumScheduler<checksum::CRC32, DIConvertManager::convertWithDiskImage:error:::ExecSchedulerItBinder::ExecutionSchedulerSortedConsecutiveItTransform, locks::Std>, LockingPolicy = locks::Std]";
        *((void *)&v161 + 1) = 156;
        LODWORD(v162) = 2;
        sub_100029AD4(v229, &v161);
        uint64_t v105 = sub_10000D6B0((uint64_t)&v190, *v104 + 32);
        sub_100029F60(v239, *(void *)(v105 + 56));
        std::ostream::~ostream();
        sub_10002AA20((uint64_t)v229);
        std::ios::~ios();
      }
      atomic_store(0, v193);
      sub_10002236C((int *)v229, 1);
      sub_10011875C((uint64_t)v165, (int *)v229, 0);
      if (*((void *)&v146 + 1)) {
        sub_100004944(*((std::__shared_weak_count **)&v146 + 1));
      }
      v106 = [(DIConvertManager *)v136 convertParams];
      unint64_t v107 = (unint64_t)[v106 maxRawUDIFRunSize];

      if (v107)
      {
        if (!(v107 >> 20))
        {
          exception = __cxa_allocate_exception(0x40uLL);
          void *exception = &off_1001C3DE8;
          v129 = std::generic_category();
          exception[1] = 22;
          exception[2] = v129;
          *((unsigned char *)exception + 24) = 0;
          *((unsigned char *)exception + 48) = 0;
          exception[7] = "Raw run size limit cannot be smaller than compressed run size limit";
        }
        char v196 = 0;
      }
      v231[1] = 0;
      v231[0] = 0;
      *(_OWORD *)&v229[8] = 0u;
      memset(v230, 0, 44);
      *(void *)v229 = 850045863;
      v230[6] = v231;
      sub_10010B464((uint64_t)&v232, (uint64_t)v144);
      sub_10010B464((uint64_t)&v236, (uint64_t)v144);
      sub_10010B464((uint64_t)v237, (uint64_t)v142);
      char v238 = 0;
      if (!sub_10010B4D0((uint64_t)&v232, (uint64_t)v237))
      {
        uint64_t v108 = v233;
        if ((v235[0] & 2) == 0) {
          uint64_t v108 = v233 + 1;
        }
        v237[7] = v108;
      }
      v109 = (void *)*v104;
      if ((void *)*v104 == v137)
      {
        uint64_t v112 = qword_1001D3B40 + 1;
      }
      else
      {
        char v110 = *((unsigned char *)v109 + 48);
        uint64_t v111 = v109[4];
        if ((v110 & 2) != 0) {
          uint64_t v112 = v111;
        }
        else {
          uint64_t v112 = v111 + 1;
        }
      }
      uint64_t v113 = sub_1000151F0((void *)(v134 + 32));
      *(void *)&long long v161 = v112;
      *((void *)&v161 + 1) = v113 + 1;
      LOBYTE(v162) = 2;
      v114 = operator new(0x140uLL);
      v114[1] = 0;
      v114[2] = 0;
      void *v114 = off_1001A0DD8;
      sub_100026D80((uint64_t)(v114 + 3), (uint64_t *)&v198, (uint64_t)&v161);
      operator new();
    }
    while (1)
    {
      v49 = v189;
      v50 = (char *)operator new(0x158uLL);
      v51 = (std::__shared_weak_count *)v50;
      *((void *)v50 + 1) = 0;
      *((void *)v50 + 2) = 0;
      *(void *)v50 = off_1001A1228;
      v52 = v50 + 24;
      if (*((char *)v48 + 79) < 0)
      {
        sub_10000A2C4(v50 + 24, (void *)v48[7], v48[8]);
      }
      else
      {
        long long v53 = *(_OWORD *)(v48 + 7);
        *((void *)v50 + 5) = v48[9];
        _OWORD *v52 = v53;
      }
      sub_100026D80((uint64_t)&v51[2], v49, (uint64_t)(v48 + 4));
      long long v161 = *((_OWORD *)v48 + 2);
      uint64_t v162 = v48[6];
      v163 = v52;
      v164 = v51;
      unint64_t v55 = v48[4];
      unint64_t v54 = v48[5];
      int v56 = *((char *)v48 + 48);
      int v57 = *((unsigned __int8 *)v48 + 48);
      v147[0] = *(_DWORD *)((char *)v48 + 49);
      *(_DWORD *)((char *)v147 + 3) = *((_DWORD *)v48 + 13);
      if (v56)
      {
        if (v57 == 3)
        {
          if (v54 < v55) {
            goto LABEL_133;
          }
        }
        else if (v55 >= v54)
        {
          goto LABEL_133;
        }
      }
      else if (v55 >= v54 || v55 + 1 >= v54)
      {
        goto LABEL_133;
      }
      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1001D4710, memory_order_acquire) & 1) == 0
        && __cxa_guard_acquire(&qword_1001D4710))
      {
        __cxa_atexit((void (*)(void *))sub_10001A1EC, &qword_1001D4700, (void *)&_mh_execute_header);
        __cxa_guard_release(&qword_1001D4710);
      }
      uint64_t v59 = qword_1001D4700;
      v58 = *(std::__shared_weak_count **)algn_1001D4708;
      if (*(void *)algn_1001D4708)
      {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)algn_1001D4708 + 8), 1uLL, memory_order_relaxed);
        v60 = v163;
        sub_100004944(v58);
      }
      else
      {
        v60 = v163;
      }
      if (v60 == (_OWORD *)v59) {
        goto LABEL_133;
      }
      v61 = (uint64_t **)sub_10000CA1C((uint64_t)&v190, v139, (uint64_t)&v161);
      if (!*v61)
      {
        v87 = v61;
        v88 = (uint64_t *)operator new(0x48uLL);
        v89 = v88;
        *(void *)&v229[8] = &v191;
        *((_OWORD *)v88 + 2) = v161;
        v90 = v164;
        v88[6] = v162;
        v88[7] = (uint64_t)v60;
        v88[8] = (uint64_t)v90;
        if (v90) {
          atomic_fetch_add_explicit(&v90->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        v229[16] = 1;
        locale = v139[0].__locale_;
        uint64_t *v88 = 0;
        v88[1] = 0;
        v88[2] = (uint64_t)locale;
        *v87 = v88;
        if (*v190)
        {
          v190 = (uint64_t **)*v190;
          v89 = *v87;
        }
        sub_10000CAF8(v191, v89);
        ++v192;
        *(void *)v229 = 0;
        sub_100029C3C((uint64_t)v229);
        goto LABEL_133;
      }
      v138 = v60;
      v62 = v191;
      v63 = &v191;
      v64 = &v191;
      if (v191)
      {
        unint64_t v65 = (v57 & 2) != 0 ? v55 : v55 + 1;
        v64 = &v191;
        v66 = v191;
        do
        {
          unint64_t v67 = (v66[6] & 1) + v66[5] - 1;
          BOOL v68 = v67 >= v65;
          if (v67 >= v65) {
            v69 = v66;
          }
          else {
            v69 = v66 + 1;
          }
          if (v68) {
            v64 = (uint64_t **)v66;
          }
          v66 = (uint64_t *)*v69;
        }
        while (*v69);
        unint64_t v70 = (v56 & 1) + v54 - 1;
        v63 = &v191;
        do
        {
          unint64_t v71 = v62[4];
          if ((v62[6] & 2) == 0) {
            ++v71;
          }
          BOOL v72 = v70 >= v71;
          if (v70 >= v71) {
            v73 = v62 + 1;
          }
          else {
            v73 = v62;
          }
          if (!v72) {
            v63 = (uint64_t **)v62;
          }
          v62 = (uint64_t *)*v73;
        }
        while (*v73);
        v74 = *v63;
        if (*v63) {
          break;
        }
      }
      do
      {
        v75 = (uint64_t *)v63;
        v63 = (uint64_t **)v63[2];
      }
      while (*v63 == v75);
      v76 = v63[1];
      if (!v76) {
        goto LABEL_86;
      }
      do
      {
        v77 = (uint64_t **)v76;
        v76 = (uint64_t *)*v76;
      }
      while (v76);
LABEL_88:
      v79 = &v191;
      if (v190 != v64)
      {
        uint64_t v80 = (uint64_t)*v64;
        v81 = v64;
        if (*v64)
        {
          do
          {
            v79 = (uint64_t **)v80;
            uint64_t v80 = *(void *)(v80 + 8);
          }
          while (v80);
        }
        else
        {
          do
          {
            v79 = (uint64_t **)v81[2];
            BOOL v82 = *v79 == (uint64_t *)v81;
            v81 = v79;
          }
          while (v82);
        }
      }
      v139[0].__locale_ = (std::locale::__imp *)qword_1001D3B40;
      v139[1].__locale_ = (std::locale::__imp *)qword_1001D3B40;
      char v140 = 2;
      *(_OWORD *)cf = *((_OWORD *)v63 + 2);
      v160 = v63[6];
      if (v77 != v64)
      {
        v83 = v164;
        while (1)
        {
          *(_OWORD *)&v139[0].__locale_ = *((_OWORD *)v64 + 2);
          char v140 = *((unsigned char *)v64 + 48);
          v156[0] = v55;
          v156[1] = v54;
          char v157 = v57;
          *(_DWORD *)v158 = v147[0];
          *(_DWORD *)&v158[3] = *(_DWORD *)((char *)v147 + 3);
          sub_10000D508(v156, (uint64_t)v139, (uint64_t)v229);
          if (v229[16])
          {
            v84 = (uint64_t *)v64;
            if (v229[16] == 3)
            {
              if (*(void *)&v229[8] >= *(void *)v229) {
                goto LABEL_103;
              }
            }
            else if (*(void *)v229 < *(void *)&v229[8])
            {
LABEL_103:
              v230[0] = v138;
              v230[1] = v83;
              if (v83) {
                atomic_fetch_add_explicit(&v83->__shared_owners_, 1uLL, memory_order_relaxed);
              }
              v84 = sub_100029C88((uint64_t **)&v190, (uint64_t)v79, (uint64_t)v229);
              if (v230[1]) {
                sub_100004944((std::__shared_weak_count *)v230[1]);
              }
            }
          }
          else if (*(void *)v229 >= *(void *)&v229[8])
          {
            v84 = (uint64_t *)v64;
          }
          else
          {
            v84 = (uint64_t *)v64;
            if ((unint64_t)(*(void *)v229 + 1) < *(void *)&v229[8]) {
              goto LABEL_103;
            }
          }
          v153[0] = v55;
          v153[1] = v54;
          char v154 = v57;
          *(_DWORD *)v155 = v147[0];
          *(_DWORD *)&v155[3] = *(_DWORD *)((char *)v147 + 3);
          sub_10000D5DC((uint64_t)v153, (uint64_t)v139, (uint64_t)v229);
          v85 = (uint64_t *)v84[1];
          v86 = v84;
          if (v85)
          {
            do
            {
              v64 = (uint64_t **)v85;
              v85 = (uint64_t *)*v85;
            }
            while (v85);
          }
          else
          {
            do
            {
              v64 = (uint64_t **)v86[2];
              BOOL v82 = *v64 == v86;
              v86 = (uint64_t *)v64;
            }
            while (!v82);
          }
          unint64_t v54 = *(void *)&v229[8];
          unint64_t v55 = *(void *)v229;
          v79 = (uint64_t **)v84;
          LOBYTE(v57) = v229[16];
          if (v64 == v77) {
            goto LABEL_121;
          }
        }
      }
      v84 = (uint64_t *)v79;
LABEL_121:
      v148[0] = v55;
      v148[1] = v54;
      char v149 = v57;
      *(_DWORD *)v150 = v147[0];
      *(_DWORD *)&v150[3] = *(_DWORD *)((char *)v147 + 3);
      sub_10000D5DC((uint64_t)v148, (uint64_t)cf, (uint64_t)&v151);
      if ((_BYTE)v152)
      {
        if (v152 == 3)
        {
          if (*((void *)&v151 + 1) >= (unint64_t)v151) {
            goto LABEL_129;
          }
          goto LABEL_133;
        }
        unint64_t v92 = *((void *)&v151 + 1);
        unint64_t v93 = v151;
      }
      else
      {
        unint64_t v92 = *((void *)&v151 + 1);
        if ((unint64_t)v151 >= *((void *)&v151 + 1)) {
          goto LABEL_133;
        }
        unint64_t v93 = v151 + 1;
      }
      if (v93 < v92)
      {
LABEL_129:
        *(_OWORD *)v229 = v151;
        *(void *)&v229[16] = v152;
        v230[0] = v138;
        v230[1] = v164;
        if (v164) {
          atomic_fetch_add_explicit(&v164->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        sub_100029C88((uint64_t **)&v190, (uint64_t)v84, (uint64_t)v229);
        if (v230[1]) {
          sub_100004944((std::__shared_weak_count *)v230[1]);
        }
      }
LABEL_133:
      if (v164) {
        sub_100004944(v164);
      }
      v94 = (void *)v48[1];
      if (v94)
      {
        do
        {
          v95 = v94;
          v94 = (void *)*v94;
        }
        while (v94);
      }
      else
      {
        do
        {
          v95 = (void *)v48[2];
          BOOL v82 = *v95 == (void)v48;
          v48 = v95;
        }
        while (!v82);
      }
      v48 = v95;
      if (v95 == v137) {
        goto LABEL_144;
      }
    }
    do
    {
      v63 = (uint64_t **)v74;
      v74 = (uint64_t *)v74[1];
    }
    while (v74);
LABEL_86:
    v77 = v63;
    do
    {
      v78 = v77;
      v77 = (uint64_t **)v77[2];
    }
    while (*v77 != (uint64_t *)v78);
    goto LABEL_88;
  }
  v14 = [(DIConvertManager *)v136 convertParams];
  if ([v14 useFormatMappingInfo]) {
    int v15 = 2;
  }
  else {
    int v15 = 0;
  }
  sub_1000091B8(*(void *)a3, v15, 7, (uint64_t)v165);

  sub_1000133F8((uint64_t)v165, (uint64_t)"Could not get mapping information", (uint64_t)v229);
  v16 = (uint64_t *)sub_1000092C4((uint64_t)v229);
  sub_100014C40((uint64_t)v200, v16);
  uint64_t v17 = (*(uint64_t (**)(void))(**(void **)a3 + 32))();
  uint64_t v18 = (*(uint64_t (**)(void))(**(void **)a3 + 24))();
  v19 = [(DIConvertManager *)v136 convertParams];
  uint64_t v20 = v18 * v17;
  if ([v19 outputFormat] == (id)1)
  {
  }
  else
  {
    v23 = [(DIConvertManager *)v136 convertParams];
    BOOL v24 = [v23 outputFormat] == (id)8;

    if (!v24)
    {
      v34 = [(DIConvertManager *)v136 convertParams];
      BOOL v35 = [v34 outputFormat] == (id)7;

      if (v35)
      {
        v36 = [(DIConvertManager *)v136 outputParams];
        v37 = v36;
        if (v36)
        {
          [v36 backend];
          long long v38 = v227[0];
        }
        else
        {
          long long v38 = 0uLL;
        }
        long long v198 = v38;
        v227[0] = 0uLL;

        unsigned int v115 = (*(uint64_t (**)(void, uint64_t))(*(void *)v198 + 56))(v198, v20);
        if (!v115)
        {
          [(DIConvertManager *)v136 convertParams];
          [(id)objc_claimAutoreleasedReturnValue() rawBlockSize];
          operator new();
        }
        v132 = __cxa_allocate_exception(0x40uLL);
        void *v132 = &off_1001C3DE8;
        v133 = std::generic_category();
        v132[1] = v115;
        v132[2] = v133;
        *((unsigned char *)v132 + 24) = 0;
        *((unsigned char *)v132 + 48) = 0;
        v132[7] = "failed to set the bundle's size";
      }
      v130 = __cxa_allocate_exception(0x40uLL);
      void *v130 = &off_1001C3DE8;
      v131 = std::generic_category();
      v130[1] = 45;
      v130[2] = v131;
      *((unsigned char *)v130 + 24) = 0;
      *((unsigned char *)v130 + 48) = 0;
      v130[7] = "Destination image format is unknown";
    }
  }
  *(void *)&v227[0] = 0;
  DWORD2(v227[0]) = 0;
  v25 = [(DIConvertManager *)v136 convertParams];
  BOOL v26 = [v25 outputFormat] == (id)1;

  if (v26)
  {
    v27 = [(DIConvertManager *)v136 outputParams];
    if (v27) {
      [v27 backend];
    }
    else {
      long long v198 = 0uLL;
    }
    [(DIConvertManager *)v136 convertParams];
    [(id)objc_claimAutoreleasedReturnValue() rawBlockSize];
    operator new();
  }
  v28 = [(DIConvertManager *)v136 convertParams];
  BOOL v29 = [v28 outputFormat] == (id)8;

  if (v29)
  {
    v144[0] = 0;
    v30 = [(DIConvertManager *)v136 convertParams];
    BOOL v31 = [v30 conversionMethod] == (id)2;

    if (v31)
    {
      v32 = [(DIConvertManager *)v136 outputParams];
      v33 = v32;
      if (v32)
      {
        [v32 backend];
      }
      else
      {
        uint64_t v226 = 0;
        v225 = 0;
      }

      sub_1000EDA68(&v198, v225);
      operator new();
    }
    __int16 v221 = 1;
    char v222 = 0;
    uint64_t v223 = 0;
    char v224 = 0;
    unint64_t v116 = *(void *)a3;
    uint64_t v117 = **(void **)a3;
    if (v118) {
      HIBYTE(v221) = v118[185];
    }
    (*(void (**)(unint64_t))(v117 + 24))(v116);
    (*(void (**)(void))(**(void **)a3 + 32))();
    (*(void (**)(void))(**(void **)a3 + 24))();
    v119 = [(DIConvertManager *)v136 outputParams];
    if (v119)
    {
      [v119 backend];
    }
    else
    {
      uint64_t v226 = 0;
      v225 = 0;
    }
    operator new();
  }
  *(void *)&long long v198 = a3;
  *((void *)&v198 + 1) = v200;
  uint64_t v199 = v20;
  if (DWORD2(v227[0]) == -1) {
    sub_1000289E8();
  }
  v225 = &v198;
  ((void (*)(long long **, _OWORD *))off_1001A0F88[DWORD2(v227[0])])(&v225, v227);
  v120 = [(DIConvertManager *)v136 convertParams];
  if ([v120 outputFormat] == (id)8)
  {
    v121 = [(DIConvertManager *)v136 convertParams];
    BOOL v122 = [v121 conversionMethod] == (id)2;

    if (v122)
    {
      if (*(void *)a3)
      {
        if (v123)
        {
          uint64_t v124 = *v135;
          *(void *)&long long v198 = sub_10007170C((uint64_t)v123);
          *((void *)&v198 + 1) = v125;
          sub_1000F1548(v124, &v198);
        }
      }
    }
  }
  else
  {
  }
  sub_100028D58((uint64_t)v227);
  sub_10000C78C(&v202);
  uint64_t v126 = v201;
  uint64_t v201 = 0;
  if (v126) {
    (*(void (**)(uint64_t))(*(void *)v126 + 40))(v126);
  }
  uint64_t v127 = sub_10000C670((uint64_t)v235);
  if (v234) {
    uint64_t v127 = sub_10000C6D4((uint64_t)v230);
  }
  if (v166) {
    return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)sub_1000274B0((uint64_t)v165);
  }
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)v127;
}

- (void)convertUserDataWithDiskImage:(void *)a3 destination:(void *)a4
{
  int v7 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v8 = sub_1000D848C();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)&buf[4] = 61;
    __int16 v14 = 2080;
    int v15 = "-[DIConvertManager convertUserDataWithDiskImage:destination:]";
    objc_super v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf(__stderrp, "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    unsigned int v10 = sub_1000D848C();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)&buf[4] = 61;
      __int16 v14 = 2080;
      int v15 = "-[DIConvertManager convertUserDataWithDiskImage:destination:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Converting user data", buf, 0x12u);
    }
  }
  *__error() = v7;
  v11 = [(DIConvertManager *)self convertParams];
  unsigned __int8 v12 = +[DIConvertParams isUDIFWithFormat:](DIConvertParams, "isUDIFWithFormat:", [v11 outputFormat]);

  if ((v12 & 1) == 0)
  {
    (*(void (**)(uint8_t *__return_ptr))(**(void **)a3 + 104))(buf);
    if (CFDictionaryGetCount(*(CFDictionaryRef *)buf)) {
      (*(void (**)(void, void))(**(void **)a4 + 112))(*(void *)a4, *(void *)buf);
    }
    sub_10000D758((const void **)buf);
  }
}

- (BOOL)runWithError:(id *)a3
{
  uint64_t v42 = 0;
  id v5 = [(DIConvertManager *)self convertParams];
  v6 = [v5 diskImageParamsXPC];
  int v7 = [(DIConvertManager *)self outputParams];
  uint64_t v8 = [v7 shadowChain];
  id v9 = [(id)v8 shouldValidate];
  if (v6)
  {
    [v6 createDiskImageWithCache:0 shadowValidation:v9];
    uint64_t v10 = *(void *)buf;
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)buf = 0;
  uint64_t v42 = v10;

  v11 = [(DIConvertManager *)self outputParams];
  unsigned __int8 v12 = [v11 diskImageParamsXPC];
  LOBYTE(v8) = [v12 lockBackendsWithError:a3];

  if ((v8 & 1) == 0) {
    goto LABEL_20;
  }
  CFStringRef v13 = [(DIConvertManager *)self convertParams];
  if ([v13 inPlaceConversion])
  {

    goto LABEL_8;
  }
  __int16 v14 = [(DIConvertManager *)self convertParams];
  int v15 = [v14 diskImageParamsXPC];
  LOBYTE(v8) = [v15 lockBackendsWithError:a3];

  if ((v8 & 1) == 0)
  {
LABEL_20:
    LOBYTE(v8) = 0;
    int v24 = 1;
    goto LABEL_21;
  }
LABEL_8:
  int v16 = *__error();
  if (sub_1000D850C())
  {
    uint64_t v44 = 0;
    uint64_t v17 = sub_1000D848C();
    os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    uint64_t v18 = [(DIConvertManager *)self convertParams];
    v19 = +[DIHelpers stringWithImageFormat:](DIHelpers, "stringWithImageFormat:", [v18 outputFormat]);
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 33;
    __int16 v46 = 2080;
    uint64_t v47 = "-[DIConvertManager runWithError:]";
    __int16 v48 = 2114;
    uint64_t v49 = (uint64_t)v19;
    LODWORD(v41) = 28;
    v40 = buf;
    uint64_t v8 = _os_log_send_and_compose_impl();

    if (v8)
    {
      fprintf(__stderrp, "%s\n", (const char *)v8);
      free((void *)v8);
    }
  }
  else
  {
    uint64_t v20 = sub_1000D848C();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [(DIConvertManager *)self convertParams];
      uint64_t v8 = +[DIHelpers stringWithImageFormat:](DIHelpers, "stringWithImageFormat:", [v21 outputFormat]);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 33;
      __int16 v46 = 2080;
      uint64_t v47 = "-[DIConvertManager runWithError:]";
      __int16 v48 = 2114;
      uint64_t v49 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: Converting to %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v16;
  if (![(DIConvertManager *)self validateFormatsWithDiskImage:v42 error:a3]) {
    goto LABEL_20;
  }
  [(DIConvertManager *)self convertWithDiskImage:&v42 error:a3];
  [(DIConvertManager *)self convertUserDataWithDiskImage:&v42 destination:buf];
  v22 = (void *)(*(uint64_t (**)(void))(**(void **)buf + 136))(*(void *)buf);
  uint64_t v23 = sub_10001494C(v22);
  if (v23)
  {
    LOBYTE(v8) = +[DIError failWithPOSIXCode:v23 error:a3];
    int v24 = 1;
    if (!v22) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  int v24 = 0;
  if (v22) {
LABEL_17:
  }
    (*(void (**)(void *))(*v22 + 40))(v22);
LABEL_18:
  uint64_t v25 = *(void *)buf;
  *(void *)buf = 0;
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
  }
LABEL_21:
  uint64_t v26 = v42;
  uint64_t v42 = 0;
  if (v26) {
    (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
  }
  if (!v24)
  {
    int v27 = *__error();
    if (sub_1000D850C())
    {
      uint64_t v44 = 0;
      v28 = sub_1000D848C();
      os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
      BOOL v29 = [(DIConvertManager *)self outputParams];
      v30 = v29;
      if (v29)
      {
        [v29 backend];
        uint64_t v31 = v42;
      }
      else
      {
        uint64_t v31 = 0;
        uint64_t v42 = 0;
        uint64_t v43 = 0;
      }
      uint64_t v36 = (*(uint64_t (**)(uint64_t))(*(void *)v31 + 40))(v31);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 33;
      __int16 v46 = 2080;
      uint64_t v47 = "-[DIConvertManager runWithError:]";
      __int16 v48 = 2048;
      uint64_t v49 = v36;
      v37 = (char *)_os_log_send_and_compose_impl();
      if (v43) {
        sub_100004944(v43);
      }

      if (v37)
      {
        fprintf(__stderrp, "%s\n", v37);
        free(v37);
      }
    }
    else
    {
      v32 = sub_1000D848C();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = [(DIConvertManager *)self outputParams];
        v34 = v33;
        if (v33)
        {
          [v33 backend];
          uint64_t v35 = v42;
        }
        else
        {
          uint64_t v35 = 0;
          uint64_t v42 = 0;
          uint64_t v43 = 0;
        }
        uint64_t v38 = (*(uint64_t (**)(uint64_t))(*(void *)v35 + 40))(v35);
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 33;
        __int16 v46 = 2080;
        uint64_t v47 = "-[DIConvertManager runWithError:]";
        __int16 v48 = 2048;
        uint64_t v49 = v38;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%.*s: Conversion completed, output file size: %llu bytes", buf, 0x1Cu);
        if (v43) {
          sub_100004944(v43);
        }
      }
    }
    *__error() = v27;
    LOBYTE(v8) = 1;
  }
  return v8 & 1;
}

- (void)dealloc
{
  v3 = [(DIConvertManager *)self outputParams];
  v4 = v3;
  if (v3)
  {
    [v3 backend];
  }
  else
  {
    uint64_t v8 = 0;
    id v9 = 0;
  }
  sub_1001493EC((uint64_t)&v8, &lpsrc);
  if (v9) {
    sub_100004944(v9);
  }

  if (lpsrc)
  {
    if (v5)
    {
      v6 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*(void (**)(void *))(*(void *)v5 + 8))(v5);
      if (v6) {
        sub_100004944(v6);
      }
    }
  }
  if (v11) {
    sub_100004944(v11);
  }
  v7.receiver = self;
  v7.super_class = (Class)DIConvertManager;
  [(DIConvertManager *)&v7 dealloc];
}

- (DIConvertParams)convertParams
{
  return self->_convertParams;
}

- (void)setConvertParams:(id)a3
{
}

- (void)setOutputParams:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputParams, 0);
  objc_storeStrong((id *)&self->_convertParams, 0);
}

@end