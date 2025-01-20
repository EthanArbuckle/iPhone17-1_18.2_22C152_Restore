@interface IOSurface(BaseBoard)
+ (uint64_t)bs_IOSurfaceWithWidth:()BaseBoard height:options:;
- (BSCGImageFromIOSurfaceBuilder)CGImageBuilder;
@end

@implementation IOSurface(BaseBoard)

+ (uint64_t)bs_IOSurfaceWithWidth:()BaseBoard height:options:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"options"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      *(_DWORD *)buf = 138544642;
      id v67 = v42;
      __int16 v68 = 2114;
      v69 = v44;
      __int16 v70 = 2048;
      uint64_t v71 = a1;
      __int16 v72 = 2114;
      v73 = @"IOSurface+BaseBoard.m";
      __int16 v74 = 1024;
      int v75 = 52;
      __int16 v76 = 2114;
      v77 = v41;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v41 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFC7D8);
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    v45 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"in_width >= 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      *(_DWORD *)buf = 138544642;
      id v67 = v46;
      __int16 v68 = 2114;
      v69 = v48;
      __int16 v70 = 2048;
      uint64_t v71 = a1;
      __int16 v72 = 2114;
      v73 = @"IOSurface+BaseBoard.m";
      __int16 v74 = 1024;
      int v75 = 53;
      __int16 v76 = 2114;
      v77 = v45;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v45 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFC8E0);
  }
  if ((a4 & 0x8000000000000000) != 0)
  {
    v49 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"in_height >= 0"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v50 = (id)objc_claimAutoreleasedReturnValue();
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      *(_DWORD *)buf = 138544642;
      id v67 = v50;
      __int16 v68 = 2114;
      v69 = v52;
      __int16 v70 = 2048;
      uint64_t v71 = a1;
      __int16 v72 = 2114;
      v73 = @"IOSurface+BaseBoard.m";
      __int16 v74 = 1024;
      int v75 = 54;
      __int16 v76 = 2114;
      v77 = v49;
      _os_log_error_impl(&dword_18AAA8000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    qword_1E911F420 = [v49 UTF8String];
    __break(0);
    JUMPOUT(0x18AAFC9E8);
  }
  if (MEMORY[0x18C1246C0](*MEMORY[0x1E4F2F2C0]) >= a3 && MEMORY[0x18C1246C0](*MEMORY[0x1E4F2F0E8]) >= a4)
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = [NSNumber numberWithUnsignedLong:a3];
    [v11 setObject:v12 forKey:*MEMORY[0x1E4F2EF70]];

    v13 = [NSNumber numberWithUnsignedLong:a4];
    [v11 setObject:v13 forKey:*MEMORY[0x1E4F2EF28]];

    [v11 setObject:&unk_1ED784878 forKey:*MEMORY[0x1E4F2EF20]];
    uint64_t v14 = *MEMORY[0x1E4F2EFE0];
    if ((*(unsigned char *)a5 & 4) != 0)
    {
      uint64_t v19 = MEMORY[0x18C124680](*MEMORY[0x1E4F2EFE0], 8 * a3);
      [v11 setObject:&unk_1ED784890 forKey:*MEMORY[0x1E4F2EF30]];
      v20 = [NSNumber numberWithUnsignedLong:8];
      [v11 setObject:v20 forKey:*MEMORY[0x1E4F2EF10]];

      v18 = [NSNumber numberWithUnsignedLong:v19];
      [v11 setObject:v18 forKey:*MEMORY[0x1E4F2EF18]];
      unint64_t v16 = v19 * a4;
    }
    else
    {
      uint64_t v15 = MEMORY[0x18C124680](*MEMORY[0x1E4F2EFE0], 4 * a3);
      unint64_t v16 = v15 * a4;
      if ((*a5 & 2) != 0)
      {
        if (*a5)
        {
          [v11 setObject:&unk_1ED7848A8 forKey:*MEMORY[0x1E4F2EF30]];
          v39 = [NSNumber numberWithUnsignedLong:4];
          [v11 setObject:v39 forKey:*MEMORY[0x1E4F2EF10]];

          v40 = [NSNumber numberWithUnsignedLong:v15];
          [v11 setObject:v40 forKey:*MEMORY[0x1E4F2EF18]];
        }
        else
        {
          uint64_t v23 = MEMORY[0x18C124680](v14, a3);
          v24 = (void *)MEMORY[0x1E4F2EF68];
          v63[0] = *MEMORY[0x1E4F2EF68];
          v60 = [NSNumber numberWithUnsignedLong:a3];
          v64[0] = v60;
          v63[1] = *MEMORY[0x1E4F2EF48];
          v59 = [NSNumber numberWithUnsignedLong:a4];
          v64[1] = v59;
          v25 = (void *)MEMORY[0x1E4F2EF38];
          v63[2] = *MEMORY[0x1E4F2EF38];
          v58 = [NSNumber numberWithUnsignedLong:4];
          v64[2] = v58;
          v63[3] = *MEMORY[0x1E4F2EF40];
          uint64_t v26 = [NSNumber numberWithUnsignedLong:v15];
          v27 = (void *)MEMORY[0x1E4F2EF58];
          uint64_t v28 = *MEMORY[0x1E4F2EF58];
          v57 = (void *)v26;
          v64[3] = v26;
          v64[4] = &unk_1ED7848C0;
          v29 = (void *)MEMORY[0x1E4F2EF60];
          uint64_t v30 = *MEMORY[0x1E4F2EF60];
          v63[4] = v28;
          v63[5] = v30;
          v53 = [NSNumber numberWithUnsignedLong:v16];
          v64[5] = v53;
          v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:6];
          v65[0] = v56;
          v61[0] = *v24;
          [NSNumber numberWithUnsignedLong:a3];
          v55 = v31 = v29;
          v62[0] = v55;
          v61[1] = *MEMORY[0x1E4F2EF48];
          v54 = [NSNumber numberWithUnsignedLong:a4];
          v62[1] = v54;
          v61[2] = *v25;
          v32 = [NSNumber numberWithUnsignedLong:1];
          v62[2] = v32;
          v61[3] = *MEMORY[0x1E4F2EF40];
          v33 = [NSNumber numberWithUnsignedLong:v23];
          v62[3] = v33;
          v61[4] = *v27;
          v34 = [NSNumber numberWithUnsignedLong:v16];
          unint64_t v35 = v23 * a4;
          v62[4] = v34;
          v61[5] = *v31;
          v36 = [NSNumber numberWithUnsignedLong:v35];
          v62[5] = v36;
          v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:6];
          v65[1] = v37;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:2];

          [v11 setObject:&unk_1ED7848D8 forKey:*MEMORY[0x1E4F2EF30]];
          [v11 setObject:v38 forKey:*MEMORY[0x1E4F2EF50]];

          v16 += v35;
        }
        goto LABEL_12;
      }
      [v11 setObject:&unk_1ED7848F0 forKey:*MEMORY[0x1E4F2EF30]];
      v17 = [NSNumber numberWithUnsignedLong:4];
      [v11 setObject:v17 forKey:*MEMORY[0x1E4F2EF10]];

      v18 = [NSNumber numberWithUnsignedLong:v15];
      [v11 setObject:v18 forKey:*MEMORY[0x1E4F2EF18]];
    }

    *a5 &= 0xFFFFFFFFFFFFFFFCLL;
LABEL_12:
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", MEMORY[0x18C124680](*MEMORY[0x1E4F2EFB8], v16));
    [v11 setObject:v21 forKey:*MEMORY[0x1E4F2EF08]];

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F2EF78]) initWithProperties:v11];
    return v10;
  }
  return 0;
}

- (BSCGImageFromIOSurfaceBuilder)CGImageBuilder
{
  v2 = [BSCGImageFromIOSurfaceBuilder alloc];
  id v3 = a1;
  if (v2)
  {
    v6.receiver = v2;
    v6.super_class = (Class)BSCGImageFromIOSurfaceBuilder;
    v4 = (BSCGImageFromIOSurfaceBuilder *)objc_msgSendSuper2(&v6, sel_init);
    v2 = v4;
    if (v4) {
      objc_storeStrong((id *)&v4->_surface, a1);
    }
  }

  return v2;
}

@end