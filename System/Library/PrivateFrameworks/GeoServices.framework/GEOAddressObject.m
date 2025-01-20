@interface GEOAddressObject
+ (BOOL)isLoggingDebug;
+ (BOOL)isMarkingMMStrings;
+ (BOOL)supportsSecureCoding;
+ (GEOAddressObject)addressObjectWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6;
+ (id)addressObjectForPlaceData:(id)a3;
+ (id)libraryVersion;
+ (void)markMMStrings:(BOOL)a3;
+ (void)setLoggingDebug:(BOOL)a3;
- (BOOL)hasKnownAccuracy;
- (BOOL)isEqual:(id)a3;
- (GEOAddressObject)initWithCNPostalAddress:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6;
- (GEOAddressObject)initWithCoder:(id)a3;
- (GEOAddressObject)initWithContactAddressDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6;
- (GEOAddressObject)initWithCurrentCountry;
- (GEOAddressObject)initWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6 language:(id)a7 country:(id)a8 phoneticLocale:(id)a9;
- (GEOAddressObject)initWithProtobufEncodedAsBase64String:(id)a3;
- (NSString)displayLanguage;
- (id)aboveDoorShortAddress;
- (id)address;
- (id)addressDictionary;
- (id)cityAndAboveNoCurrentCountryWithFallback:(BOOL)a3;
- (id)cityAndAboveWithFallback:(BOOL)a3;
- (id)cityAndAboveWithFallback:(BOOL)a3 relative:(id)a4;
- (id)cityDisplayNameWithFallback:(BOOL)a3;
- (id)cnPostalAddress;
- (id)countryName;
- (id)fullAddressNoCurrentCountryWithMultiline:(BOOL)a3;
- (id)fullAddressWithMultiline:(BOOL)a3;
- (id)fullAddressWithMultiline:(BOOL)a3 relative:(id)a4;
- (id)locationAddress;
- (id)name;
- (id)neighborhoodName:(BOOL)a3;
- (id)parkingDisplayName;
- (id)phoneticAddress;
- (id)phoneticLocaleIdentifier;
- (id)phoneticName;
- (id)rawBytes;
- (id)shortAddress;
- (id)spokenAddress;
- (id)spokenAddressForLocale:(id)a3;
- (id)spokenName;
- (id)spokenStructuredAddress;
- (id)titlesForMapRect:(id)a3;
- (id)venueLabel;
- (id)venueLabel:(int64_t)a3;
- (id)venueLevel;
- (id)venueShortAddress;
- (id)weatherDisplayName;
- (id)weatherLocationName;
- (int)knownAccuracy;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOAddressObject

void __63__GEOAddressObject_PlaceDataExtras__addressObjectForPlaceData___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = a2;
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *a3 = 1;
    goto LABEL_29;
  }
  v17 = v5;
  v6 = -[GEOPDComponent values](v5);
  v7 = v17;
  if (!v17)
  {
    [*(id *)(a1 + 32) hasMuid];
    goto LABEL_28;
  }
  if ((*((_WORD *)v17 + 50) & 0x80) != 0)
  {
    if (*((_DWORD *)v17 + 22) != 31) {
      goto LABEL_36;
    }
    uint64_t v12 = [v6 firstObject];
    v9 = (void *)v12;
    if (v12 && *(void *)(v12 + 40))
    {
      uint64_t v10 = -[GEOPDComponentValue addressObject]((id *)v12);
      uint64_t v11 = *(void *)(a1 + 40);
      goto LABEL_26;
    }

    v7 = v17;
    if ((*((_WORD *)v17 + 50) & 0x80) != 0)
    {
LABEL_36:
      if (*((_DWORD *)v7 + 22) != 5) {
        goto LABEL_22;
      }
      uint64_t v13 = [v6 firstObject];
      v9 = (void *)v13;
      if (v13 && *(void *)(v13 + 56))
      {
        uint64_t v10 = -[GEOPDComponentValue address]((id *)v13);
        uint64_t v11 = *(void *)(a1 + 56);
        goto LABEL_26;
      }

      v7 = v17;
      if ((*((_WORD *)v17 + 50) & 0x80) != 0)
      {
LABEL_22:
        if (*((_DWORD *)v7 + 22) == 2)
        {
          uint64_t v14 = [v6 firstObject];
          v9 = (void *)v14;
          if (v14 && *(void *)(v14 + 400))
          {
            uint64_t v10 = -[GEOPDComponentValue placeInfo]((id *)v14);
            uint64_t v11 = *(void *)(a1 + 48);
            goto LABEL_26;
          }
        }
      }
    }
  }
  if (([*(id *)(a1 + 32) hasMuid] & 1) != 0
    || (*((_WORD *)v17 + 50) & 0x80) == 0
    || *((_DWORD *)v17 + 22) != 1)
  {
    goto LABEL_28;
  }
  uint64_t v8 = [v6 firstObject];
  v9 = (void *)v8;
  if (!v8 || !*(void *)(v8 + 192)) {
    goto LABEL_27;
  }
  uint64_t v10 = -[GEOPDComponentValue entity]((id *)v8);
  uint64_t v11 = *(void *)(a1 + 64);
LABEL_26:
  uint64_t v15 = *(void *)(v11 + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v10;

LABEL_27:
LABEL_28:

  v5 = v17;
LABEL_29:
}

- (void).cxx_destruct
{
}

+ (id)libraryVersion
{
  uint64_t v2 = NSString;
  addr_obj::getVersion(__p);
  v3 = +[NSString stringWithStdString:copy:](v2, (uint64_t *)__p);
  if (v6 < 0) {
    operator delete(__p[0]);
  }

  return v3;
}

+ (BOOL)isLoggingDebug
{
  return isLoggingDebug_;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOAddressObject)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"addrObj"])
  {
    v12.receiver = self;
    v12.super_class = (Class)GEOAddressObject;
    v5 = [(GEOAddressObject *)&v12 init];
    if (v5)
    {
      char v6 = objc_alloc_init(_GEOAddressObject);
      pimpl = v5->_pimpl;
      v5->_pimpl = v6;

      size_t __len = 0;
      uint64_t v8 = (void *)[v4 decodeBytesForKey:@"addrObj" returnedLength:&__len];
      if (__len)
      {
        if (v8)
        {
          std::string::basic_string[abi:ne180100](__p, v8, __len);
          if (_MergedGlobals_335 != -1) {
            dispatch_once(&_MergedGlobals_335, &__block_literal_global_201);
          }
          addr_obj::AddressObjectFactory::fromBytes((addr_obj::Logger *)qword_1EB2A0770, __p);
        }
      }
    }
  }
  else
  {
    v5 = self;
  }

  return 0;
}

- (void)dealloc
{
  knownAccuracy = self->_knownAccuracy;
  if (knownAccuracy)
  {
    MEMORY[0x18C11F580](knownAccuracy, 0x1000C4052888210);
    self->_knownAccuracy = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)GEOAddressObject;
  [(GEOAddressObject *)&v4 dealloc];
}

+ (id)addressObjectForPlaceData:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__37;
  v34 = __Block_byref_object_dispose__37;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__37;
  v28 = __Block_byref_object_dispose__37;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__37;
  v22 = __Block_byref_object_dispose__37;
  id v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__37;
  v16[4] = __Block_byref_object_dispose__37;
  id v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__GEOAddressObject_PlaceDataExtras__addressObjectForPlaceData___block_invoke;
  v10[3] = &unk_1E53E1918;
  objc_super v12 = &v30;
  uint64_t v13 = &v18;
  uint64_t v14 = &v24;
  id v5 = v4;
  id v11 = v5;
  uint64_t v15 = v16;
  [v5 enumerateValidComponentsWithValuesUsingBlock:v10];
  if (v31[5] && v19[5] || v25[5])
  {
    char v6 = +[GEOAddressObject addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:](GEOAddressObject, "addressObjectWithPlaceDataAddressObject:placeDataAddress:placeDataInfo:placeDataEntity:");
  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceDataExtras");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138477827;
      v37 = v8;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ cannot build GEOAddressObject unless it has a GEOPDAddressObject and a GEOPDPlaceInfo, or an old GEOPDAddress.", buf, 0xCu);
    }
    char v6 = 0;
  }

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v6;
}

+ (GEOAddressObject)addressObjectWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v14 = [v13 firstObject];

  uint64_t v15 = [MEMORY[0x1E4F1CA20] currentLocale];
  v16 = [v15 objectForKey:*MEMORY[0x1E4F1C400]];

  if (!v16)
  {
    id v17 = [NSString stringWithFormat:@"[NSLocale currentLocale] failed for NSLocaleCountryCode"];
    uint64_t v18 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v17;
      _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v16 = &stru_1ED51F370;
  }
  v19 = [[GEOAddressObject alloc] initWithPlaceDataAddressObject:v9 placeDataAddress:v10 placeDataInfo:v11 placeDataEntity:v12 language:v14 country:v16 phoneticLocale:v14];

  return v19;
}

- (GEOAddressObject)initWithPlaceDataAddressObject:(id)a3 placeDataAddress:(id)a4 placeDataInfo:(id)a5 placeDataEntity:(id)a6 language:(id)a7 country:(id)a8 phoneticLocale:(id)a9
{
  buf[17] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v19 = v16;
  id v94 = v18;
  id v91 = a7;
  id v92 = a8;
  id v93 = a9;
  v95._unknownFields = (PBUnknownFields *)self;
  v95._formattedAddressLines = (NSMutableArray *)GEOAddressObject;
  uint64_t v20 = objc_msgSendSuper2((objc_super *)&v95._unknownFields, sel_init);
  v21 = v20;
  if (!v20)
  {
    uint64_t v26 = 0;
    goto LABEL_105;
  }
  v20[2] = 0;
  v22 = objc_alloc_init(_GEOAddressObject);
  uint64_t v23 = (void *)v21[1];
  v21[1] = v22;

  if (v15)
  {
    uint64_t v24 = (id *)v15;
    objc_msgSend(NSString, "stringWithFormat:", @"%s forbids %s to be nil", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddressObject(GEOPDAddressObject *__strong)", "pdAddressObject");

    id v25 = v24[2];
    [(NSData *)buf cppData];

    if (_MergedGlobals_335 != -1) {
      dispatch_once(&_MergedGlobals_335, &__block_literal_global_201);
    }
    addr_obj::AddressObjectFactory::fromBytes((addr_obj::Logger *)qword_1EB2A0770, (unsigned __int8 *)buf);
  }
  if (v94)
  {
    if ([v94 namesCount])
    {
      v27 = [v94 names];
      v28 = [v27 firstObject];
      id v29 = [v28 stringValue];
    }
    else
    {
      id v29 = 0;
    }
    if ([v94 spokenNamesCount])
    {
      uint64_t v30 = [v94 spokenNames];
      v31 = [v30 firstObject];
      uint64_t v32 = [v31 stringValue];

      goto LABEL_15;
    }
  }
  else
  {
    id v29 = 0;
  }
  uint64_t v32 = 0;
LABEL_15:
  v33 = v19;
  v90 = v29;
  v34 = v32;
  v87 = (NSString *)v91;
  v86 = (NSString *)v92;
  id v85 = v93;
  v88 = v34;
  v89 = v33;
  id v35 = objc_msgSend(NSString, "stringWithFormat:", @"Check %s against nullptr before calling %s", "pdAddress", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
  v36 = v35;
  if (v33)
  {

    v37 = objc_msgSend(NSString, "stringWithFormat:", @"Check %s against nullptr before calling %s", "language", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
    v36 = v37;
    if (v87)
    {

      uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"Check %s against nullptr before calling %s", "country", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
      v36 = v38;
      if (v86)
      {

        v39 = objc_msgSend(NSString, "stringWithFormat:", @"Check %s against nullptr before calling %s", "phoneticLocale", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)");
        v36 = v39;
        if (v85)
        {

          -[GEOPDAddress _readLocalizedAddress]((uint64_t)v33);
          if ([v33[3] count])
          {
            -[GEOPDAddress _readSpokenNavigationAddress]((uint64_t)v33);
            if ([v33[4] count])
            {
              v40 = -[GEOPDAddress spokenNavigationAddress](v33);
              v78 = [v40 firstObject];
            }
            else
            {
              v78 = 0;
            }
            -[GEOPDAddress _readSpokenStructuredAddress]((uint64_t)v33);
            if ([v33[5] count])
            {
              v43 = -[GEOPDAddress spokenStructuredAddress](v33);
              v79 = [v43 firstObject];
            }
            else
            {
              v79 = 0;
            }
            long long v104 = 0u;
            long long v105 = 0u;
            long long v102 = 0u;
            long long v103 = 0u;
            v44 = -[GEOPDAddress localizedAddress](v33);
            obuint64_t j = v44;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v102 objects:buf count:16];
            if (v45)
            {
              uint64_t v82 = *(void *)v103;
              v77 = v19;
              do
              {
                uint64_t v81 = v45;
                for (uint64_t i = 0; i != v81; ++i)
                {
                  if (*(void *)v103 != v82) {
                    objc_enumerationMutation(obj);
                  }
                  -[GEOPDLocalizedAddress address](*(id **)(*((void *)&v102 + 1) + 8 * i));
                  v47 = (GEOLocalizedString *)objc_claimAutoreleasedReturnValue();
                  if ([(GEOLocalizedString *)v47 formattedAddressLinesCount])
                  {
                    _AddressObjectPtrFromLegacy(&v95, v47, v78, v79, v90, v88, v87, v86, v85);

                    goto LABEL_95;
                  }
                  if ([(GEOLocalizedString *)v47 hasStructuredAddress])
                  {
                    v48 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(v110) = 138477827;
                      *(void *)((char *)&v110 + 4) = v47;
                      _os_log_impl(&dword_188D96000, v48, OS_LOG_TYPE_DEBUG, "The GEOAddress is missing the formattedAddress: %{private}@", (uint8_t *)&v110, 0xCu);
                    }

                    v49 = [(GEOLocalizedString *)v47 structuredAddress];
                    _buildCNPostalAddressFromStructuredAddress(v49);
                    v84 = (CNPostalAddress *)objc_claimAutoreleasedReturnValue();

                    v83 = _buildMissingFormattedAddressStringFromCNPostalAddress(v84);
                    [(NSString *)&v110 stdString];
                    uint64_t v50 = v111;
                    if ((v111 & 0x80u) != 0) {
                      uint64_t v50 = *((void *)&v110 + 1);
                    }
                    if (v50)
                    {
                      if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB2A0780, memory_order_acquire) & 1) == 0
                        && __cxa_guard_acquire(&qword_1EB2A0780))
                      {
                        id v66 = objc_alloc(MEMORY[0x1E4F1CAD0]);
                        v67 = getCNPostalAddressStreetKey();
                        v76 = getCNPostalAddressCityKey();
                        v75 = getCNPostalAddressStateKey();
                        v74 = getCNPostalAddressPostalCodeKey();
                        v68 = getCNPostalAddressCountryKey();
                        v69 = getCNPostalAddressISOCountryCodeKey();
                        qword_1EB2A0778 = objc_msgSend(v66, "initWithObjects:", v67, v76, v75, v74, v68, v69, 0);

                        __cxa_guard_release(&qword_1EB2A0780);
                      }
                      v51 = objc_msgSend(NSString, "stringWithFormat:", @"%s forbids %s to be nil", "addr_obj::AddressObjectPtr _AddressObjectPtrFromGEOPDAddress(GEOPDAddress *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong, NSString *__strong)", "ContactKeySet");
                      v52 = v51;
                      if (qword_1EB2A0778)
                      {

                        long long v100 = 0u;
                        long long v101 = 0u;
                        long long v98 = 0u;
                        long long v99 = 0u;
                        v53 = [(CNPostalAddress *)v84 dictionaryRepresentation];
                        uint64_t v54 = [v53 countByEnumeratingWithState:&v98 objects:v109 count:16];
                        if (v54)
                        {
                          uint64_t v55 = *(void *)v99;
                          while (2)
                          {
                            for (uint64_t j = 0; j != v54; ++j)
                            {
                              if (*(void *)v99 != v55) {
                                objc_enumerationMutation(v53);
                              }
                              if (([(id)qword_1EB2A0778 containsObject:*(void *)(*((void *)&v98 + 1) + 8 * j)] & 1) == 0)
                              {

                                v60 = [GEOAddress alloc];
                                [(GEOLocalizedString *)v47 copyTo:v60];
                                long long v96 = 0u;
                                long long v97 = 0u;
                                memset(&v95._structuredAddress, 0, 32);
                                v61 = [v83 componentsSeparatedByString:@"\n"];
                                uint64_t v62 = [v61 countByEnumeratingWithState:&v95._structuredAddress objects:v106 count:16];
                                if (v62)
                                {
                                  uint64_t v63 = **(void **)&v95._readerLock._os_unfair_lock_opaque;
                                  do
                                  {
                                    for (uint64_t k = 0; k != v62; ++k)
                                    {
                                      if (**(void **)&v95._readerLock._os_unfair_lock_opaque != v63) {
                                        objc_enumerationMutation(v61);
                                      }
                                      [(GEOAddress *)v60 addFormattedAddressLine:*(void *)(*(void *)&v95._readerMarkPos + 8 * k)];
                                    }
                                    uint64_t v62 = [v61 countByEnumeratingWithState:&v95._structuredAddress objects:v106 count:16];
                                  }
                                  while (v62);
                                }

                                v19 = v77;
                                _AddressObjectPtrFromLegacy(&v95, (GEOLocalizedString *)v60, v78, v79, v90, v88, v87, v86, v85);

                                goto LABEL_83;
                              }
                            }
                            uint64_t v54 = [v53 countByEnumeratingWithState:&v98 objects:v109 count:16];
                            if (v54) {
                              continue;
                            }
                            break;
                          }
                        }

                        _AddressObjectPtrFromCNPostalAddress((CNPostalAddress *)v107, (NSString *)&v84->super.isa, v87, v86, v85);
                        if (*(void *)&v108[4]) {
                          std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&v108[4]);
                        }
                        int v57 = 1;
                      }
                      else
                      {
                        v65 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v107 = 138543362;
                          *(void *)v108 = v52;
                          _os_log_impl(&dword_188D96000, v65, OS_LOG_TYPE_ERROR, "%{public}@", v107, 0xCu);
                        }

                        v95.super.super.isa = 0;
                        v95._reader = 0;

LABEL_83:
                        int v57 = 0;
                      }
                    }
                    else
                    {
                      v59 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)v107 = 0;
                        _os_log_impl(&dword_188D96000, v59, OS_LOG_TYPE_DEBUG, "Empty formatted address and address dictionary, can't create AddressObject", v107, 2u);
                      }

                      int v57 = 0;
                      v95.super.super.isa = 0;
                      v95._reader = 0;
                    }
                    if ((char)v111 < 0) {
                      operator delete((void *)v110);
                    }

                    if (!v57)
                    {

                      goto LABEL_95;
                    }
                  }
                  else
                  {
                    v58 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(v110) = 138477827;
                      *(void *)((char *)&v110 + 4) = v47;
                      _os_log_impl(&dword_188D96000, v58, OS_LOG_TYPE_DEBUG, "A GEOPDLocalizedAddress in localizedAddress is missing formatted and structured address: %{private}@", (uint8_t *)&v110, 0xCu);
                    }
                  }
                }
                v44 = obj;
                uint64_t v45 = [obj countByEnumeratingWithState:&v102 objects:buf count:16];
              }
              while (v45);
            }

            v95.super.super.isa = 0;
            v95._reader = 0;
LABEL_95:
          }
          else
          {
            v42 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(buf[0]) = 0;
              _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_DEBUG, "No localized addresses, can't create AddressObject", (uint8_t *)buf, 2u);
            }

            v95.super.super.isa = 0;
            v95._reader = 0;
          }
          goto LABEL_96;
        }
        v41 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf[0]) = 138543362;
          *(void *)((char *)buf + 4) = v36;
          _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)buf, 0xCu);
        }
      }
      else
      {
        v41 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf[0]) = 138543362;
          *(void *)((char *)buf + 4) = v36;
          _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)buf, 0xCu);
        }
      }
    }
    else
    {
      v41 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf[0]) = 138543362;
        *(void *)((char *)buf + 4) = v36;
        _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)buf, 0xCu);
      }
    }
  }
  else
  {
    v41 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = v36;
      _os_log_impl(&dword_188D96000, v41, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)buf, 0xCu);
    }
  }

  v95.super.super.isa = 0;
  v95._reader = 0;

LABEL_96:
  uint64_t v70 = v21[1];
  long long v71 = *(_OWORD *)&v95.super.super.isa;
  v95.super.super.isa = 0;
  v95._reader = 0;
  v72 = *(std::__shared_weak_count **)(v70 + 16);
  *(_OWORD *)(v70 + 8) = v71;
  if (v72) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v72);
  }
  if (v95._reader) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v95._reader);
  }
  if (*(void *)(v21[1] + 8))
  {
    if (-[GEOPDAddress knownAccuracy]((uint64_t)v89)) {
      operator new();
    }
    uint64_t v26 = v21;
  }
  else
  {
    uint64_t v26 = 0;
  }

LABEL_105:
  return v26;
}

- (BOOL)hasKnownAccuracy
{
  return self->_knownAccuracy != 0;
}

- (id)spokenAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 40))(__p);
    id v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject spokenAddress]");
    char v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)phoneticLocaleIdentifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    id v4 = (addr_obj::Localization *)(*(uint64_t (**)(AddressObject *, SEL))(*(void *)ptr + 152))(ptr, a2);
    PhoneticLocale = (uint64_t *)addr_obj::Localization::getPhoneticLocale(v4);
    char v6 = +[NSString stringWithStdString:copy:](v3, PhoneticLocale);
  }
  else
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject phoneticLocaleIdentifier]");
    uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v11 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    char v6 = 0;
  }

  return v6;
}

- (int)knownAccuracy
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"Check %s against nullptr before calling %s", "_knownAccuracy", "-[GEOAddressObject knownAccuracy]");
  id v4 = v3;
  if (self->_knownAccuracy)
  {

    return *self->_knownAccuracy;
  }
  else
  {
    char v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v8 = v4;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    return 0;
  }
}

- (id)address
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 24))(buf);
    uint64_t DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    uint64_t v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0) {
      uint64_t v5 = *(void *)(DisplayLanguage + 8);
    }
    if (v5)
    {
      char v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      v7 = _protobufCPPDataToObjC<GEOAddress>(v6);
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)uint64_t v13 = 138477827;
        uint64_t v14 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOAddress", v13, 0xCu);
      }
      v7 = 0;
    }
    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject address]");
    uint64_t v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(void **__return_ptr))(*(void *)ptr + 192))(__p);
    if (v9 < 0)
    {
      if (!__p[1])
      {
LABEL_8:
        operator delete(__p[0]);
        goto LABEL_9;
      }
      char v6 = (void **)__p[0];
    }
    else
    {
      if (!v9) {
        goto LABEL_9;
      }
      char v6 = __p;
    }
    objc_msgSend(v4, "encodeBytes:length:forKey:", v6);
    if ((v9 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  knownAccuracy = self->_knownAccuracy;
  if (knownAccuracy) {
    [v4 encodeInt:*knownAccuracy forKey:@"knownAccuracy"];
  }
}

- (id)rawBytes
{
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(void **__return_ptr))(*(void *)ptr + 192))(__p);
    self;
    id v3 = -[NSData initWithCPPData:copy:](objc_alloc(MEMORY[0x1E4F1C9B8]), (const void **)__p);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)cnPostalAddress
{
  if (ContactsLibraryCore())
  {
    id v3 = [(GEOAddressObject *)self address];
    id v4 = [v3 structuredAddress];
    uint64_t v5 = _buildCNPostalAddressFromStructuredAddress(v4);
    char v6 = (void *)[v5 mutableCopy];

    v7 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];

    if (v7)
    {
      uint64_t v8 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];
      [v6 setCity:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)cityDisplayNameWithFallback:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v4 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 136))(__p);
    uint64_t v5 = +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    if (v10 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    char v6 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject cityDisplayNameWithFallback:]");
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

+ (BOOL)isMarkingMMStrings
{
  return GEOConfigGetBOOL(GeoServicesConfig_AddressObjectMarkStrings, (uint64_t)off_1E9114158);
}

- (NSString)displayLanguage
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    uint64_t v4 = (addr_obj::Localization *)(*(uint64_t (**)(AddressObject *, SEL))(*(void *)ptr + 152))(ptr, a2);
    uint64_t DisplayLanguage = (uint64_t *)addr_obj::Localization::getDisplayLanguage(v4);
    char v6 = +[NSString stringWithStdString:copy:](v3, DisplayLanguage);
  }
  else
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject displayLanguage]");
    uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    char v6 = 0;
  }

  return (NSString *)v6;
}

+ (void)setLoggingDebug:(BOOL)a3
{
  isLoggingDebug_ = a3;
}

- (GEOAddressObject)initWithContactAddressDictionary:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)GEOAddressObject;
  uint64_t v14 = [(GEOAddressObject *)&v31 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  v14->_knownAccuracy = 0;
  char v16 = objc_alloc_init(_GEOAddressObject);
  pimpl = v15->_pimpl;
  v15->_pimpl = v16;

  id v29 = v10;
  id v18 = v10;
  v19 = (NSString *)v11;
  uint64_t v20 = (NSString *)v12;
  id v21 = v13;
  v22 = [[GEOStructuredAddress alloc] initWithAddressDictionary:v18];
  _buildCNPostalAddressFromStructuredAddress(v22);
  uint64_t v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  _AddressObjectPtrFromCNPostalAddress(v30, v23, v19, v20, v21);

  uint64_t v24 = v15->_pimpl;
  shared_ptr<addr_obj::AddressObject> v25 = *(shared_ptr<addr_obj::AddressObject> *)&v30[0].super.isa;
  v30[0].super.isa = 0;
  v30[1].super.isa = 0;
  cntrl = (std::__shared_weak_count *)v24->_addrObjPtr.__cntrl_;
  v24->_addrObjPtr = v25;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  id v10 = v29;
  if (v30[1].super.isa) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v30[1].super.isa);
  }
  if (v15->_pimpl->_addrObjPtr.__ptr_) {
    v27 = v15;
  }
  else {
LABEL_8:
  }
    v27 = 0;

  return v27;
}

- (GEOAddressObject)initWithCNPostalAddress:(id)a3 language:(id)a4 country:(id)a5 phoneticLocale:(id)a6
{
  id v10 = (NSString *)a3;
  id v11 = (NSString *)a4;
  id v12 = (NSString *)a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOAddressObject;
  uint64_t v14 = [(GEOAddressObject *)&v24 init];
  id v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  v14->_knownAccuracy = 0;
  char v16 = objc_alloc_init(_GEOAddressObject);
  pimpl = v15->_pimpl;
  v15->_pimpl = v16;

  _AddressObjectPtrFromCNPostalAddress((CNPostalAddress *)&v23, v10, v11, v12, v13);
  id v18 = v15->_pimpl;
  shared_ptr<addr_obj::AddressObject> v19 = v23;
  shared_ptr<addr_obj::AddressObject> v23 = (shared_ptr<addr_obj::AddressObject>)0;
  cntrl = (std::__shared_weak_count *)v18->_addrObjPtr.__cntrl_;
  v18->_addrObjPtr = v19;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  if (v23.__cntrl_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v23.__cntrl_);
  }
  if (v15->_pimpl->_addrObjPtr.__ptr_) {
    id v21 = v15;
  }
  else {
LABEL_8:
  }
    id v21 = 0;

  return v21;
}

- (GEOAddressObject)initWithCurrentCountry
{
  v22.receiver = self;
  v22.super_class = (Class)GEOAddressObject;
  uint64_t v2 = [(GEOAddressObject *)&v22 init];
  if (v2 && ContactsLibraryCore())
  {
    v2->_knownAccuracy = 0;
    uint64_t v3 = objc_alloc_init(_GEOAddressObject);
    pimpl = v2->_pimpl;
    v2->_pimpl = v3;

    uint64_t v5 = +[GEOCountryConfiguration sharedConfiguration];
    char v6 = [v5 countryCode];

    if (_MergedGlobals_335 != -1) {
      dispatch_once(&_MergedGlobals_335, &__block_literal_global_201);
    }
    v7 = (addr_obj::Logger *)qword_1EB2A0770;
    std::string::basic_string[abi:ne180100]<0>(v20, "");
    std::string::basic_string[abi:ne180100]<0>(v19, "");
    std::string::basic_string[abi:ne180100]<0>(v18, "");
    addr_obj::Localization::Localization(v21, v20, v19, v18);
    [(NSString *)v17 stdString];
    std::string::basic_string[abi:ne180100]<0>(v16, "");
    std::string::basic_string[abi:ne180100]<0>(v15, "");
    std::string::basic_string[abi:ne180100]<0>(v14, "");
    std::string::basic_string[abi:ne180100]<0>(v13, "");
    std::string::basic_string[abi:ne180100]<0>(v12, "");
    [(NSString *)v11 stdString];
    std::string::basic_string[abi:ne180100]<0>(v10, "");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    addr_obj::AddressObjectFactory::fromContact(v7, (addr_obj::Localization *)v21, (uint64_t)v17, (uint64_t)v16, (uint64_t)v15, (uint64_t)v14, (uint64_t)v13, (uint64_t)v12, (uint64_t)v11, (uint64_t)v10, (uint64_t)__p);
  }

  return 0;
}

- (GEOAddressObject)initWithProtobufEncodedAsBase64String:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v4 options:0];
  char v6 = objc_opt_new();
  -[GEOPDAddressObject setAddressObject:]((uint64_t)v6, v5);
  v7 = +[GEOAddressObject addressObjectWithPlaceDataAddressObject:v6 placeDataAddress:0 placeDataInfo:0 placeDataEntity:0];

  return v7;
}

- (id)name
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 16))(__p);
    id v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject name]");
    char v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)addressDictionary
{
  uint64_t v3 = [(GEOAddressObject *)self address];
  int v4 = [v3 hasStructuredAddress];

  if (v4)
  {
    uint64_t v5 = [(GEOAddressObject *)self address];
    char v6 = [v5 structuredAddress];
    v7 = _buildGEODictionaryFromStructuredAddress(v6);
    uint64_t v8 = (void *)[v7 mutableCopy];

    char v9 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      id v11 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];
      [v8 setObject:v11 forKeyedSubscript:@"City"];
    }
    else
    {
      [v8 removeObjectForKey:@"City"];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)spokenName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 32))(__p);
    int v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject spokenName]");
    char v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    int v4 = 0;
  }

  return v4;
}

- (id)spokenAddressForLocale:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v6 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 40))(__p);
    v7 = +[NSString stringWithStdString:copy:](v6, (uint64_t *)__p);
    if (v12 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject spokenAddressForLocale:]");
    char v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)spokenStructuredAddress
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 48))(buf);
    uint64_t DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    uint64_t v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0) {
      uint64_t v5 = *(void *)(DisplayLanguage + 8);
    }
    if (v5)
    {
      uint64_t v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      v7 = -[NSData initWithCPPData:copy:](objc_alloc(MEMORY[0x1E4F1C9B8]), v6);
      uint64_t v8 = [[GEOStructuredAddress alloc] initWithData:v7];
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)uint64_t v13 = 138477827;
        uint64_t v14 = v11;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOStructuredAddress", v13, 0xCu);
      }
      uint64_t v8 = 0;
    }

    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject spokenStructuredAddress]");
    uint64_t v10 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (id)phoneticName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 56))(__p);
    id v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject phoneticName]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    id v4 = 0;
  }

  return v4;
}

- (id)phoneticAddress
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 64))(buf);
    uint64_t DisplayLanguage = addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
    uint64_t v5 = *(unsigned __int8 *)(DisplayLanguage + 23);
    if ((v5 & 0x80u) != 0) {
      uint64_t v5 = *(void *)(DisplayLanguage + 8);
    }
    if (v5)
    {
      uint64_t v6 = (const void **)addr_obj::Localization::getDisplayLanguage((addr_obj::Localization *)buf);
      v7 = _protobufCPPDataToObjC<GEOAddress>(v6);
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
      uint64_t v10 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        id v11 = NSStringFromSelector(a2);
        *(_DWORD *)uint64_t v13 = 138477827;
        uint64_t v14 = v11;
        _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "%{private}@ could not get a GEOAddress", v13, 0xCu);
      }
      v7 = 0;
    }
    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject phoneticAddress]");
    char v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)fullAddressWithMultiline:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    uint64_t v4 = NSString;
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 72))(__p);
    uint64_t v5 = +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    if (v10 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject fullAddressWithMultiline:]");
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)fullAddressWithMultiline:(BOOL)a3 relative:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a4;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    uint64_t v13 = 0;
    if (v5)
    {
      v7 = *(std::__shared_weak_count **)(v5[1] + 16);
      if (v7)
      {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        ptr = self->_pimpl->_addrObjPtr.__ptr_;
      }
      uint64_t v13 = v7;
    }
    uint64_t v8 = NSString;
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 80))(__p);
    char v9 = +[NSString stringWithStdString:copy:](v8, (uint64_t *)__p);
    if (v15 < 0) {
      operator delete(*(void **)__p);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
  else
  {
    char v10 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject fullAddressWithMultiline:relative:]");
    uint64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v10;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (id)fullAddressNoCurrentCountryWithMultiline:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [[GEOAddressObject alloc] initWithCurrentCountry];
  uint64_t v6 = [(GEOAddressObject *)self fullAddressWithMultiline:v3 relative:v5];

  return v6;
}

- (id)shortAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 88))(__p);
    uint64_t v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject shortAddress]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)countryName
{
  uint64_t v2 = [(GEOAddressObject *)self address];
  uint64_t v3 = [v2 structuredAddress];
  uint64_t v4 = [v3 country];

  return v4;
}

- (id)weatherDisplayName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 224))(__p);
    uint64_t v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject weatherDisplayName]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)weatherLocationName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 232))(__p);
    uint64_t v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject weatherLocationName]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)parkingDisplayName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 216))(__p);
    uint64_t v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject parkingDisplayName]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (id)venueLabel:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    if ((unint64_t)(a3 - 1) < 3) {
      unsigned int v4 = a3;
    }
    else {
      unsigned int v4 = 0;
    }
    uint64_t v5 = NSString;
    uint64_t v6 = (*(uint64_t (**)(AddressObject *, SEL))(*(void *)ptr + 160))(ptr, a2);
    addr_obj::VenueInfo::getLabel(v6, v4, &__p);
    v7 = +[NSString stringWithStdString:copy:](v5, (uint64_t *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject venueLabel:]");
    char v9 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p.__r_.__value_.__l.__data_) = 138543362;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
      _os_log_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "%{public}@@", (uint8_t *)&__p, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)venueLabel
{
  return [(GEOAddressObject *)self venueLabel:3];
}

- (id)venueLevel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    unsigned int v4 = (addr_obj::VenueInfo *)(*(uint64_t (**)(AddressObject *, SEL))(*(void *)ptr + 160))(ptr, a2);
    Level = (uint64_t *)addr_obj::VenueInfo::getLevel(v4);
    uint64_t v6 = +[NSString stringWithStdString:copy:](v3, Level);
  }
  else
  {
    v7 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject venueLevel]");
    uint64_t v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v11 = v7;
      _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)venueShortAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 240))(__p);
    unsigned int v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject venueShortAddress]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    unsigned int v4 = 0;
  }

  return v4;
}

- (id)locationAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 256))(__p);
    unsigned int v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject locationAddress]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    unsigned int v4 = 0;
  }

  return v4;
}

- (id)titlesForMapRect:(id)a3
{
  double v4 = GEOMetersBetweenMapPoints(a3.var0.var0, a3.var0.var1 + a3.var1.var1 * 0.5, a3.var0.var0 + a3.var1.var0, a3.var0.var1 + a3.var1.var1 * 0.5);
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:10];
  uint64_t v6 = [(GEOAddressObject *)self address];
  v7 = [v6 structuredAddress];

  if (([v7 hasOcean] & 1) == 0)
  {
    if (v4 < 7500.0 && [v7 hasSubLocality])
    {
      uint64_t v8 = [v7 subLocality];
      [v5 addObject:v8];
    }
    if (v4 < 30000.0)
    {
      char v9 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        uint64_t v11 = [(GEOAddressObject *)self cityDisplayNameWithFallback:0];
        [v5 addObject:v11];
      }
    }
    if (v4 < 45000.0 && [v7 hasSubAdministrativeArea])
    {
      uint64_t v12 = [v7 subAdministrativeArea];
      [v5 addObject:v12];
    }
    if (v4 < 130000.0 && [v7 hasAdministrativeArea])
    {
      uint64_t v13 = [v7 administrativeArea];
      [v5 addObject:v13];
    }
    if (v4 < 2500000.0 && [v7 hasCountry])
    {
      uint64_t v14 = [v7 country];
      [v5 addObject:v14];
    }
  }
  id v15 = v5;
  uint64_t v16 = v15;
  if ((unint64_t)[v15 count] >= 2)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithOrderedSet:range:copyItems:", v15, 0, 2, 0);

    CFArrayRef v17 = CFLocaleCopyPreferredLanguages();
    CFArrayRef v18 = v17;
    if (v17)
    {
      if (CFArrayGetCount(v17) >= 1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, 0);
        CFStringRef v20 = ValueAtIndex;
        if (ValueAtIndex)
        {
          if (CFStringHasPrefix(ValueAtIndex, @"ja")
            || CFStringHasPrefix(v20, @"zh")
            || CFStringHasPrefix(v20, @"ko"))
          {
            uint64_t v21 = [v16 reversedOrderedSet];

            uint64_t v16 = (void *)v21;
          }
        }
      }
      CFRelease(v18);
    }
  }

  return v16;
}

- (id)neighborhoodName:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v4 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 264))(__p);
    uint64_t v5 = +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    if (v10 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject neighborhoodName:]");
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)cityAndAboveWithFallback:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v4 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 112))(__p);
    uint64_t v5 = +[NSString stringWithStdString:copy:](v4, (uint64_t *)__p);
    if (v10 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject cityAndAboveWithFallback:]");
    v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v6;
      _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)cityAndAboveWithFallback:(BOOL)a3 relative:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a4;
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr)
  {
    uint64_t v13 = 0;
    if (v5)
    {
      v7 = *(std::__shared_weak_count **)(v5[1] + 16);
      if (v7)
      {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        ptr = self->_pimpl->_addrObjPtr.__ptr_;
      }
      uint64_t v13 = v7;
    }
    uint64_t v8 = NSString;
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 120))(__p);
    char v9 = +[NSString stringWithStdString:copy:](v8, (uint64_t *)__p);
    if (v15 < 0) {
      operator delete(*(void **)__p);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
  }
  else
  {
    char v10 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject cityAndAboveWithFallback:relative:]");
    uint64_t v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v10;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    char v9 = 0;
  }

  return v9;
}

- (id)cityAndAboveNoCurrentCountryWithFallback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [[GEOAddressObject alloc] initWithCurrentCountry];
  uint64_t v6 = [(GEOAddressObject *)self cityAndAboveWithFallback:v3 relative:v5];

  return v6;
}

- (id)aboveDoorShortAddress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  uint64_t v3 = NSString;
  if (ptr)
  {
    (*(void (**)(unsigned char *__return_ptr))(*(void *)ptr + 104))(__p);
    uint64_t v4 = +[NSString stringWithStdString:copy:](v3, (uint64_t *)__p);
    if (v9 < 0) {
      operator delete(*(void **)__p);
    }
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject aboveDoorShortAddress]");
    uint64_t v6 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)std::string __p = 138543362;
      *(void *)&__p[4] = v5;
      _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_ERROR, "%{public}@@", __p, 0xCu);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GEOAddressObject *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = v5;
    ptr = self->_pimpl->_addrObjPtr.__ptr_;
    uint64_t v8 = v6->_pimpl->_addrObjPtr.__ptr_;
    char v9 = ((unint64_t)ptr | (unint64_t)v8) == 0;
    if (ptr) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (!v10) {
      char v9 = (*(uint64_t (**)(AddressObject *))(*(void *)ptr + 272))(ptr);
    }
  }
  else
  {
LABEL_10:
    char v9 = 0;
  }
LABEL_12:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  ptr = self->_pimpl->_addrObjPtr.__ptr_;
  if (ptr) {
    return (*(uint64_t (**)(AddressObject *, SEL))(*(void *)ptr + 288))(ptr, a2);
  }
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"The AO has not been created prior to calling %s", "-[GEOAddressObject hash]");
  uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOAddressObject");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v7 = v4;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, "%{public}@@", buf, 0xCu);
  }

  return 0;
}

+ (void)markMMStrings:(BOOL)a3
{
  BOOL v3 = a3;
  GEOConfigSetBOOL(GeoServicesConfig_AddressObjectMarkStrings, (uint64_t)off_1E9114158);

  addr_obj::Debugging::addChar(v3);
}

@end