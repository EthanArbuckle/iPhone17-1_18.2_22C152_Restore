@interface CLLocationGroup
+ (vector<std::string,)stringVectorFromNSArray:(id)a2;
+ (void)storeAverage:(id)a3 ofVertices:(id)a4;
- (BOOL)allowCellularDownload:(unint64_t)a3;
- (CLLocationGroup)init;
- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8;
- (ECEFCoordinate)centerECEF;
- (GeographicCoordinate)centerLatLon;
- (NSString)groupId;
- (basic_string<char,)getGroupId;
- (const)getLocationIds;
- (const)getVertices;
- (double)distance:(id)a3;
- (double)tolerance;
- (id).cxx_construct;
- (int64_t)locationContext;
- (set<unsigned)wifiOnlyDownloadLocIdxs;
- (vector<std::string,)locationIds;
- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long;
@end

@implementation CLLocationGroup

- (const)getVertices
{
  return &self->vertices;
}

+ (vector<std::string,)stringVectorFromNSArray:(id)a2
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  id v34 = v5;
  unint64_t v10 = objc_msgSend_count(v5, v6, v7, v8, v9);
  sub_221E2D63C((uint64_t)retstr, v10);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v34;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v39;
    id v35 = v11;
    do
    {
      uint64_t v15 = 0;
      uint64_t v36 = v13;
      do
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(id *)(*((void *)&v38 + 1) + 8 * v15);
        v17 = (void *)MEMORY[0x223C92960]();
        id v18 = v16;
        v23 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21, v22);
        v24 = v23;
        v37 = v23;
        end = retstr->__end_;
        if (end >= retstr->__end_cap_.__value_)
        {
          v29 = sub_221E30394(&retstr->__begin_, &v37);
          goto LABEL_17;
        }
        size_t v26 = strlen(v23);
        if (v26 >= 0x7FFFFFFFFFFFFFF8) {
          sub_221DE2208();
        }
        size_t v27 = v26;
        if (v26 >= 0x17)
        {
          uint64_t v30 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v26 | 7) != 0x17) {
            uint64_t v30 = v26 | 7;
          }
          uint64_t v31 = v30 + 1;
          v28 = operator new(v30 + 1);
          end[1] = v27;
          end[2] = v31 | 0x8000000000000000;
          void *end = v28;
          id v11 = v35;
        }
        else
        {
          *((unsigned char *)end + 23) = v26;
          v28 = end;
          if (!v26) {
            goto LABEL_16;
          }
        }
        memmove(v28, v24, v27);
LABEL_16:
        *((unsigned char *)v28 + v27) = 0;
        v29 = (char *)(end + 3);
        retstr->__end_ = end + 3;
        uint64_t v13 = v36;
LABEL_17:
        retstr->__end_ = v29;

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v32, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v13);
  }

  return result;
}

- (const)getLocationIds
{
  return &self->_locationIds;
}

- (basic_string<char,)getGroupId
{
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(*(void **)(v1 + 16), v2, v3, v4, v5);
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)strlen(v7);
  if ((unint64_t)result >= 0x7FFFFFFFFFFFFFF8) {
    sub_221DE2208();
  }
  unint64_t v9 = (unint64_t)result;
  if ((unint64_t)result >= 0x17)
  {
    unint64_t v10 = ((unint64_t)result & 0xFFFFFFFFFFFFFFF8) + 8;
    if (((unint64_t)result | 7) != 0x17) {
      unint64_t v10 = (unint64_t)result | 7;
    }
    unint64_t v11 = v10 + 1;
    v12 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)operator new(v10 + 1);
    retstr->__r_.__value_.var0.var1.__size_ = v9;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = v11 | 0x8000000000000000;
    retstr->__r_.__value_.var0.var1.__data_ = (char *)v12;
    retstr = v12;
  }
  else
  {
    *((unsigned char *)&retstr->__r_.__value_.var0.var1 + 23) = (_BYTE)result;
    if (!result)
    {
      retstr->__r_.__value_.var0.var0.__data_[0] = 0;
      return result;
    }
  }
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)memmove(retstr, v7, v9);
  retstr->__r_.__value_.var0.var0.__data_[v9] = 0;
  return result;
}

+ (void)storeAverage:(id)a3 ofVertices:(id)a4
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = objc_msgSend_count(v6, v7, v8, v9, v10);
  if (v11)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v12 = v6;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v18)
    {
      uint64_t v19 = *(void *)v43;
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v12);
          }
          v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          objc_msgSend_x(v24, v14, v15, v16, v17, (void)v42);
          double v26 = v25;
          objc_msgSend_y(v24, v27, v28, v29, v30);
          double v32 = v31;
          objc_msgSend_z(v24, v33, v34, v35, v36);
          double v20 = v20 + v26;
          double v21 = v21 + v32;
          double v22 = v22 + v37;
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v42, (uint64_t)v46, 16);
      }
      while (v18);
    }
    else
    {
      double v20 = 0.0;
      double v21 = 0.0;
      double v22 = 0.0;
    }

    objc_msgSend_setFromX_y_z_(v5, v38, v39, v40, v41, v20 / (double)(unint64_t)v11, v21 / (double)(unint64_t)v11, v22 / (double)(unint64_t)v11);
  }
}

- (CLLocationGroup)initWithGroupId:(id)a3 locationIds:(id)a4 center:(id)a5 wifiOnlyDownloadLocIdxs:(const void *)a6 locationContext:(int64_t)a7 andTolerance:(double)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v61.receiver = self;
  v61.super_class = (Class)CLLocationGroup;
  uint64_t v18 = [(CLLocationGroup *)&v61 init];
  uint64_t v19 = v18;
  double v20 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_groupId, a3);
    objc_msgSend_stringVectorFromNSArray_(CLLocationGroup, v21, (uint64_t)v16, v22, v23);
    p_begin = &v20->_locationIds.__begin_;
    begin = (void **)v20->_locationIds.__begin_;
    if (begin)
    {
      end = (void **)v20->_locationIds.__end_;
      size_t v27 = v20->_locationIds.__begin_;
      if (end != begin)
      {
        do
        {
          if (*((char *)end - 1) < 0) {
            operator delete(*(end - 3));
          }
          end -= 3;
        }
        while (end != begin);
        size_t v27 = *p_begin;
      }
      v20->_locationIds.__end_ = begin;
      operator delete(v27);
      *p_begin = 0;
      v20->_locationIds.__end_ = 0;
      v20->_locationIds.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v20->_locationIds.__begin_ = v59;
    v20->_locationIds.__end_cap_.__value_ = v60;
    uint64_t v28 = [ECEFCoordinate alloc];
    objc_msgSend_x(v17, v29, v30, v31, v32);
    double v34 = v33;
    objc_msgSend_y(v17, v35, v36, v37, v38);
    double v40 = v39;
    objc_msgSend_z(v17, v41, v42, v43, v44);
    uint64_t v50 = objc_msgSend_initWithX_y_z_(v28, v45, v46, v47, v48, v34, v40, v49);
    centerECEF = v20->_centerECEF;
    v20->_centerECEF = (ECEFCoordinate *)v50;

    v52 = [GeographicCoordinate alloc];
    uint64_t v56 = objc_msgSend_initFromECEFCoordinate_(v52, v53, (uint64_t)v20->_centerECEF, v54, v55);
    centerLatLon = v20->_centerLatLon;
    v20->_centerLatLon = (GeographicCoordinate *)v56;

    v20->_tolerance = a8;
    if (&v19->_wifiOnlyDownloadLocIdxs != a6) {
      sub_221E30000((uint64_t **)&v19->_wifiOnlyDownloadLocIdxs, *(void **)a6, (void *)a6 + 1);
    }
    v20->_locationContext = a7;
    operator new();
  }

  return 0;
}

- (CLLocationGroup)init
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  uint64_t v4 = objc_alloc_init(ECEFCoordinate);
  v9[0] = 0;
  v9[1] = 0;
  uint64_t v8 = v9;
  id v6 = (CLLocationGroup *)objc_msgSend_initWithGroupId_locationIds_center_wifiOnlyDownloadLocIdxs_locationContext_andTolerance_(self, v5, (uint64_t)&stru_26D46D2C0, (uint64_t)v3, (uint64_t)v4, &v8, 0, 0.0);
  sub_221E28BE0((uint64_t)&v8, v9[0]);

  return v6;
}

- (double)distance:(id)a3
{
  id v4 = a3;
  id v6 = objc_msgSend_fromLatLonOrigin_andEcefOrigin_andEcefPoint_(ENUCoordinate, v5, (uint64_t)self->_centerLatLon, (uint64_t)self->_centerECEF, (uint64_t)v4);
  objc_msgSend_east(v6, v7, v8, v9, v10);
  double v12 = v11;
  objc_msgSend_north(v6, v13, v14, v15, v16);
  v23[0] = v12;
  v23[1] = v17;
  value = self->vertices.__ptr_.__value_;
  if (*value == value[1])
  {
    double v21 = (void *)value[3];
    uint64_t v22 = (void *)value[4];
    if (v21 == v22)
    {
LABEL_6:
      double v26 = &unk_26D46B990;
      v24.i64[0] = (uint64_t)"/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.ap"
                            "p/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/us"
                            "r/local/include/boost/geometry/algorithms/detail/throw_on_empty_input.hpp";
      v24.i64[1] = (uint64_t)"void boost::geometry::detail::throw_on_empty_input(const Geometry &) [Geometry = boost::geom"
                            "etry::model::polygon<boost::geometry::model::d2::point_xy<double>>]";
      uint64_t v25 = 54;
      sub_221E2E218((uint64_t)&v26, &v24);
    }
    while (*v21 == v21[1])
    {
      v21 += 3;
      if (v21 == v22) {
        goto LABEL_6;
      }
    }
  }
  double v19 = sub_221E2EC1C(v23, (uint64_t)value);

  return v19;
}

- (BOOL)allowCellularDownload:(unint64_t)a3
{
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_;
  id v4 = left;
  if (!left) {
    goto LABEL_12;
  }
  id v6 = p_pair1;
  do
  {
    unint64_t v7 = (unint64_t)v4[4].__value_.__left_;
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)v4;
    }
    else {
      uint64_t v9 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long, void *>>> **)&v4[1];
    }
    if (v8) {
      id v6 = v4;
    }
    id v4 = *v9;
  }
  while (*v9);
  if (v6 == p_pair1 || v6[4].__value_.__left_ > (void *)a3) {
LABEL_12:
  }
    id v6 = p_pair1;
  return v6 == p_pair1;
}

- (NSString)groupId
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (vector<std::string,)locationIds
{
  objc_copyCppObjectAtomic(retstr, &self->_locationIds, (void (__cdecl *)(void *, const void *))sub_221E2DFB0);
  return result;
}

- (ECEFCoordinate)centerECEF
{
  return (ECEFCoordinate *)objc_getProperty(self, a2, 24, 1);
}

- (GeographicCoordinate)centerLatLon
{
  return (GeographicCoordinate *)objc_getProperty(self, a2, 32, 1);
}

- (double)tolerance
{
  return self->_tolerance;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (set<unsigned)wifiOnlyDownloadLocIdxs
{
  objc_copyCppObjectAtomic(retstr, &self->_wifiOnlyDownloadLocIdxs, (void (__cdecl *)(void *, const void *))sub_221E2E01C);
  return result;
}

- (void)setWifiOnlyDownloadLocIdxs:(set<unsigned)long
{
}

- (void).cxx_destruct
{
  sub_221E28BE0((uint64_t)&self->_wifiOnlyDownloadLocIdxs, (void *)self->_wifiOnlyDownloadLocIdxs.__tree_.__pair1_.__value_.__left_);
  begin = (void **)self->_locationIds.__begin_;
  if (begin)
  {
    end = (void **)self->_locationIds.__end_;
    id v5 = self->_locationIds.__begin_;
    if (end != begin)
    {
      do
      {
        if (*((char *)end - 1) < 0) {
          operator delete(*(end - 3));
        }
        end -= 3;
      }
      while (end != begin);
      id v5 = self->_locationIds.__begin_;
    }
    self->_locationIds.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_centerLatLon, 0);
  objc_storeStrong((id *)&self->_centerECEF, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  value = (void **)self->vertices.__ptr_.__value_;
  self->vertices.__ptr_.__value_ = 0;
  if (value)
  {
    unint64_t v7 = (char *)value[3];
    if (v7)
    {
      BOOL v8 = (char *)value[4];
      uint64_t v9 = value[3];
      if (v8 != v7)
      {
        uint64_t v10 = (char *)value[4];
        do
        {
          double v12 = (void *)*((void *)v10 - 3);
          v10 -= 24;
          double v11 = v12;
          if (v12)
          {
            *((void *)v8 - 2) = v11;
            operator delete(v11);
          }
          BOOL v8 = v10;
        }
        while (v10 != v7);
        uint64_t v9 = value[3];
      }
      value[4] = v7;
      operator delete(v9);
    }
    uint64_t v13 = *value;
    if (*value)
    {
      value[1] = v13;
      operator delete(v13);
    }
    JUMPOUT(0x223C92640);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = (char *)self + 88;
  return self;
}

@end