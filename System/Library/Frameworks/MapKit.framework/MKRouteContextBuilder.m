@interface MKRouteContextBuilder
- (float)_defaultPuckRadius;
- (id)buildRouteContextForAnchorPoints:(id)a3;
- (id)buildRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
@end

@implementation MKRouteContextBuilder

- (id)buildRouteContextForRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v92 = a3;
  if ([v92 count] <= a4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v92 objectAtIndexedSubscript:a4];
  }
  v91 = v5;
  if ([v5 transportType] == 1) {
    int v6 = 1;
  }
  else {
    int v6 = [v91 isWalkingOnlyTransitRoute];
  }
  id v97 = (id)[objc_alloc(MEMORY[0x1E4FB3A78]) initWithComposedRoute:v91 useType:v6 ^ 1u];
  [(MKRouteContextBuilder *)self _defaultPuckRadius];
  objc_msgSend(v97, "setPuckRadius:");
  v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v8 = [v7 firstObject];
  [v97 setLocale:v8];

  v9 = _MKLocalizedStringFromThisBundle(@"AccessPointEntryName");
  [v97 setAccessPointEntryName:v9];

  v10 = _MKLocalizedStringFromThisBundle(@"AccessPointExitName");
  [v97 setAccessPointExitName:v10];

  v89 = objc_opt_new();
  unint64_t v11 = [v92 count];
  unint64_t v12 = v11;
  v102 = 0;
  v103 = 0;
  v104 = 0;
  *(void *)buf = &v102;
  buf[8] = 0;
  if (v11)
  {
    if (v11 >> 61) {
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v11;
    v14 = (uint64_t *)operator new(8 * v11);
    v102 = v14;
    v104 = (char *)&v14[v12];
    bzero(v14, 8 * v12);
    v103 = (char *)&v14[v13];
  }
  uint64_t v15 = [v97 routeInfo];
  v16 = (void *)v102[a4];
  v102[a4] = v15;

  if ([v92 count] == 1)
  {
    std::vector<RouteSection>::vector((char **)buf, [v92 count]);
    uint64_t v17 = *v102;
    v18 = [v92 objectAtIndexedSubscript:0];
    uint64_t v19 = [v18 endRouteCoordinate];
    uint64_t v20 = *(void *)buf;
    **(void **)buf = v17;
    *(void *)(v20 + 8) = 0;
    *(void *)(v20 + 16) = v19;

    objc_msgSend(v97, "addShareSections:shareCount:");
    id v21 = v97;
    if (*(void *)buf)
    {
      *(void *)&buf[8] = *(void *)buf;
      operator delete(*(void **)buf);
    }
  }
  else
  {
    if (!self->_routeOverlapCache)
    {
      v22 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      routeOverlapCache = self->_routeOverlapCache;
      self->_routeOverlapCache = v22;

      [(NSCache *)self->_routeOverlapCache setCountLimit:10];
    }
    id v87 = objc_alloc_init(MEMORY[0x1E4F7A088]);
    for (unint64_t i = 0; i < [v92 count]; ++i)
    {
      uint64_t v25 = [v92 objectAtIndex:i];
      v26 = (void *)v25;
      if ((void *)v25 != v91)
      {
        v106[0] = v25;
        v106[1] = v91;
        os_log_t log = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
        uint64_t v27 = _MKRouteContextBuilderCacheEntryKey(log);
        v28 = self->_routeOverlapCache;
        uint64_t v29 = [NSNumber numberWithUnsignedInteger:v27];
        v30 = [(NSCache *)v28 objectForKey:v29];

        v31 = [v30 overlapResults];
        LOBYTE(v29) = v31 == 0;

        if (v29)
        {
          v38 = MKGetMKRouteContextBuilderLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v39 = [v26 uniqueRouteID];
            v40 = [v39 UUIDString];
            v41 = [v91 uniqueRouteID];
            v42 = [v41 UUIDString];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v40;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v42;
            _os_log_impl(&dword_18BAEC000, v38, OS_LOG_TYPE_INFO, "Calling findFirstUniqueRangeBetweenRoutes because no cache entry was found for route pair %@, %@", buf, 0x16u);
          }
          v32 = [v87 findFirstUniqueRangeBetweenRoute:v26 andRoute:v91];
          v43 = [[_MKRouteContextBuilderCacheEntry alloc] initWithRoutes:log];

          [(_MKRouteContextBuilderCacheEntry *)v43 setOverlapResults:v32];
          v44 = self->_routeOverlapCache;
          v33 = [NSNumber numberWithUnsignedInteger:v27];
          [(NSCache *)v44 setObject:v43 forKey:v33];
          v30 = v43;
        }
        else
        {
          v32 = [v30 overlapResults];
          v33 = MKGetMKRouteContextBuilderLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = [v26 uniqueRouteID];
            v35 = [v34 UUIDString];
            v36 = [v91 uniqueRouteID];
            v37 = [v36 UUIDString];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v35;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v37;
            _os_log_impl(&dword_18BAEC000, v33, OS_LOG_TYPE_INFO, "Cache entry was found for route pair %@, %@", buf, 0x16u);
          }
        }
        v45 = v32;

        if (![v32 count]
          || ([v32 objectAtIndexedSubscript:0],
              v46 = objc_claimAutoreleasedReturnValue(),
              [v46 uniqueRanges],
              v47 = objc_claimAutoreleasedReturnValue(),
              BOOL v48 = [v47 count] == 0,
              v47,
              v46,
              v48))
        {
          LODWORD(v51) = 0;
          LODWORD(v53) = 0;
          unint64_t v54 = 0xBF80000000000000;
          unint64_t v55 = 0xBF80000000000000;
        }
        else
        {
          v49 = [v32 objectAtIndexedSubscript:0];
          v50 = [v49 uniqueRanges];
          uint64_t v51 = [v50 coordinateRangeAtIndex:0];
          uint64_t v53 = v52;

          unint64_t v54 = v51 & 0xFFFFFFFF00000000;
          unint64_t v55 = v53 & 0xFFFFFFFF00000000;
        }
        uint64_t v56 = [objc_alloc(MEMORY[0x1E4FB39E0]) initWithComposedRoute:v26 etaText:0 divergenceRouteCoordinate:v51 | v54 convergenceRouteCoordinate:v53 | v55];
        [v89 addObject:v56];
        v57 = (void *)v102[i];
        v102[i] = v56;
      }
    }
    [v97 setAlternateRoutes:v89];
    uint64_t v58 = _MKRouteContextBuilderCacheEntryKey(v92);
    v59 = self->_routeOverlapCache;
    uint64_t v60 = [NSNumber numberWithUnsignedInteger:v58];
    v88 = [(NSCache *)v59 objectForKey:v60];

    v61 = [v88 overlappingSections];
    LOBYTE(v60) = v61 == 0;

    loga = MKGetMKRouteContextBuilderLog();
    BOOL v62 = os_log_type_enabled(loga, OS_LOG_TYPE_INFO);
    if (v60)
    {
      if (v62)
      {
        v64 = [v92 valueForKey:@"uniqueRouteID"];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v64;
        _os_log_impl(&dword_18BAEC000, loga, OS_LOG_TYPE_INFO, "Calling findOverlappingSectionsForRoutes because no cache entry was found for route set %@", buf, 0xCu);
      }
      uint64_t v65 = [v87 findOverlappingSectionsForRoutes:v92];
      v66 = [[_MKRouteContextBuilderCacheEntry alloc] initWithRoutes:v92];
      os_log_t logb = (os_log_t)v65;

      [(_MKRouteContextBuilderCacheEntry *)v66 setOverlappingSections:v65];
      v67 = self->_routeOverlapCache;
      v68 = [NSNumber numberWithUnsignedInteger:v58];
      [(NSCache *)v67 setObject:v66 forKey:v68];

      v88 = v66;
    }
    else
    {
      if (v62)
      {
        v63 = [v92 valueForKey:@"uniqueRouteID"];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v63;
        _os_log_impl(&dword_18BAEC000, loga, OS_LOG_TYPE_INFO, "Cache entry was found for route set %@", buf, 0xCu);
      }
      os_log_t logb = [v88 overlappingSections];
    }
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    os_log_t logc = logb;
    uint64_t v69 = [logc countByEnumeratingWithState:&v98 objects:v105 count:16];
    if (v69)
    {
      uint64_t v70 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v99 != v70) {
            objc_enumerationMutation(logc);
          }
          v72 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          v73 = [v72 components];
          std::vector<RouteSection>::vector((char **)buf, [v73 count]);

          uint64_t v74 = 0;
          for (unint64_t k = 0; ; ++k)
          {
            v76 = [v72 components];
            BOOL v77 = k < [v76 count];

            if (!v77) {
              break;
            }
            v78 = [v72 components];
            v79 = [v78 objectAtIndexedSubscript:k];

            uint64_t v80 = [v79 routeIndex];
            uint64_t v81 = v102[v80];
            uint64_t v82 = [v79 range];
            [v79 range];
            v83 = (void *)(*(void *)buf + v74);
            void *v83 = v81;
            v83[1] = v82;
            v83[2] = v84;

            v74 += 24;
          }
          objc_msgSend(v97, "addShareSections:shareCount:");
          if (*(void *)buf)
          {
            *(void *)&buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
        }
        uint64_t v69 = [logc countByEnumeratingWithState:&v98 objects:v105 count:16];
      }
      while (v69);
    }

    id v85 = v97;
  }
  *(void *)buf = &v102;
  std::vector<VKRouteInfo * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);

  return v97;
}

- (id)buildRouteContextForAnchorPoints:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4FB3A78]);
  int v6 = [v4 firstObject];
  v7 = (void *)[v5 initWithAnchorPoint:v6 useType:1];

  [(MKRouteContextBuilder *)self _defaultPuckRadius];
  objc_msgSend(v7, "setPuckRadius:");
  v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v9 = [v8 firstObject];
  [v7 setLocale:v9];

  return v7;
}

- (float)_defaultPuckRadius
{
  +[_MKPuckAnnotationView baseDiameter];
  *(float *)&double v2 = v2;
  return *(float *)&v2 * 0.5;
}

- (void).cxx_destruct
{
}

@end