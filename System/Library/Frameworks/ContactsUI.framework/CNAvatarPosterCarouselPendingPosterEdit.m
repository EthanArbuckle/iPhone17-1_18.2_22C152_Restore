@interface CNAvatarPosterCarouselPendingPosterEdit
+ (id)pendingEditFromContactPoster:(id)a3;
+ (id)pendingEditFromPosterConfiguration:(id)a3;
- (CNAvatarPosterCarouselPendingPosterEdit)initWithContactPoster:(id)a3 posterConfiguration:(id)a4;
- (CNContactPoster)contactPoster;
- (CNFuture)pendingWallpaper;
- (CNPRSPosterConfiguration)posterConfiguration;
- (id)pendingWallpaperFromContactPoster;
- (id)pendingWallpaperFromPosterConfiguration;
- (void)setContactPoster:(id)a3;
- (void)setPendingWallpaper:(id)a3;
- (void)setPosterConfiguration:(id)a3;
@end

@implementation CNAvatarPosterCarouselPendingPosterEdit

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingWallpaper, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);

  objc_storeStrong((id *)&self->_contactPoster, 0);
}

- (void)setPendingWallpaper:(id)a3
{
}

- (void)setPosterConfiguration:(id)a3
{
}

- (CNPRSPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (void)setContactPoster:(id)a3
{
}

- (CNContactPoster)contactPoster
{
  return self->_contactPoster;
}

- (id)pendingWallpaperFromPosterConfiguration
{
  v3 = [(CNAvatarPosterCarouselPendingPosterEdit *)self posterConfiguration];

  if (v3)
  {
    objc_initWeak(location, self);
    v4 = (void *)MEMORY[0x1E4F5A408];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromPosterConfiguration__block_invoke;
    v10[3] = &unk_1E5496B38;
    objc_copyWeak(&v11, location);
    v5 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    v6 = [v5 backgroundScheduler];
    v7 = [v4 futureWithBlock:v10 scheduler:v6];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    v8 = CNUILogPosters();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to create wallpaper future, nil poster configuration", (uint8_t *)location, 2u);
    }

    v7 = 0;
  }

  return v7;
}

id __82__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromPosterConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained posterConfiguration];
  id v20 = 0;
  v3 = +[CNPRSPosterArchiver archiveCNConfiguration:v2 error:&v20];
  id v4 = v20;

  if (v3)
  {
    v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3];
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A268] + 16))())
    {
      v6 = CNUILogPosters();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18B625000, v6, OS_LOG_TYPE_ERROR, "Poster archive data from poster editor configuration is empty.", buf, 2u);
      }

      v7 = [MEMORY[0x1E4F1CA98] null];
    }
    else
    {
      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v19 = v4;
      char v10 = [v9 removeItemAtURL:v3 error:&v19];
      id v11 = v19;

      if ((v10 & 1) == 0)
      {
        v12 = CNUILogPosters();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v3;
          _os_log_debug_impl(&dword_18B625000, v12, OS_LOG_TYPE_DEBUG, "Failed to clean up archive poster at URL %@", buf, 0xCu);
        }
      }
      v13 = [WeakRetained posterConfiguration];
      v14 = +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:v13];

      v15 = (void *)MEMORY[0x1E4F1BAE0];
      v16 = [WeakRetained posterConfiguration];
      v7 = [v15 wallpaperWithPosterArchiveData:v5 metadataFromConfiguration:v16 visualFingerprint:v14 contentIsSensitive:0];

      id v4 = v11;
    }
  }
  else
  {
    v8 = CNUILogPosters();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v18 = [v4 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v22 = v18;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to archive poster configuration %@", buf, 0xCu);
    }
    v7 = [MEMORY[0x1E4F1CA98] null];
  }

  return v7;
}

- (id)pendingWallpaperFromContactPoster
{
  v3 = [(CNAvatarPosterCarouselPendingPosterEdit *)self contactPoster];

  if (v3)
  {
    objc_initWeak(location, self);
    id v4 = (void *)MEMORY[0x1E4F5A408];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromContactPoster__block_invoke;
    v10[3] = &unk_1E5496B38;
    objc_copyWeak(&v11, location);
    v5 = [MEMORY[0x1E4F5A4F0] defaultProvider];
    v6 = [v5 backgroundScheduler];
    v7 = [v4 futureWithBlock:v10 scheduler:v6];

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    v8 = CNUILogPosters();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_18B625000, v8, OS_LOG_TYPE_ERROR, "Failed to create wallpaper future, nil contact poster", (uint8_t *)location, 2u);
    }

    v7 = 0;
  }

  return v7;
}

id __76__CNAvatarPosterCarouselPendingPosterEdit_pendingWallpaperFromContactPoster__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained contactPoster];
  v3 = [v2 posterData];
  id v15 = 0;
  id v4 = +[CNPRSPosterArchiver unarchiveCNConfigurationFromData:v3 error:&v15];
  id v5 = v15;

  if (v4)
  {
    v6 = +[CNAvatarPosterCarouselLikenessFingerprint fingerprintForPosterConfiguration:v4];
    v7 = (void *)MEMORY[0x1E4F1BAE0];
    v8 = [WeakRetained contactPoster];
    v9 = [v8 posterData];
    char v10 = [WeakRetained contactPoster];
    id v11 = objc_msgSend(v7, "wallpaperWithPosterArchiveData:metadataFromConfiguration:visualFingerprint:contentIsSensitive:", v9, v4, v6, objc_msgSend(v10, "contentIsSensitive"));
  }
  else
  {
    v12 = CNUILogPosters();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_error_impl(&dword_18B625000, v12, OS_LOG_TYPE_ERROR, "Failed to unarchive poster configuration %@", buf, 0xCu);
    }
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }

  return v11;
}

- (CNFuture)pendingWallpaper
{
  p_pendingWallpaper = &self->_pendingWallpaper;
  pendingWallpaper = self->_pendingWallpaper;
  if (pendingWallpaper)
  {
    id v4 = pendingWallpaper;
    goto LABEL_14;
  }
  uint64_t v6 = [(CNAvatarPosterCarouselPendingPosterEdit *)self contactPoster];
  if (!v6
    || (v7 = (void *)v6,
        [(CNAvatarPosterCarouselPendingPosterEdit *)self posterConfiguration],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    char v10 = [(CNAvatarPosterCarouselPendingPosterEdit *)self contactPoster];

    if (v10)
    {
      uint64_t v11 = [(CNAvatarPosterCarouselPendingPosterEdit *)self pendingWallpaperFromContactPoster];
    }
    else
    {
      v12 = [(CNAvatarPosterCarouselPendingPosterEdit *)self posterConfiguration];

      if (!v12)
      {
        v14 = CNUILogPosters();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v15 = 0;
          _os_log_error_impl(&dword_18B625000, v14, OS_LOG_TYPE_ERROR, "Invalid pending poster edit, both contact poster and configuration are nil", v15, 2u);
        }

        id v4 = 0;
        goto LABEL_13;
      }
      uint64_t v11 = [(CNAvatarPosterCarouselPendingPosterEdit *)self pendingWallpaperFromPosterConfiguration];
    }
    id v4 = (CNFuture *)v11;
LABEL_13:
    objc_storeStrong((id *)p_pendingWallpaper, v4);
    goto LABEL_14;
  }
  v9 = CNUILogPosters();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18B625000, v9, OS_LOG_TYPE_ERROR, "Invalid pending poster edit, cannot be backed by both contact poster and configuration", buf, 2u);
  }

  id v4 = 0;
LABEL_14:

  return v4;
}

- (CNAvatarPosterCarouselPendingPosterEdit)initWithContactPoster:(id)a3 posterConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNAvatarPosterCarouselPendingPosterEdit;
  v9 = [(CNAvatarPosterCarouselPendingPosterEdit *)&v15 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    if (!v7 || !v8)
    {
      objc_storeStrong((id *)&v9->_contactPoster, a3);
      objc_storeStrong(p_isa + 2, a4);
      v12 = p_isa;
      goto LABEL_9;
    }
    uint64_t v11 = CNUILogPosters();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_18B625000, v11, OS_LOG_TYPE_ERROR, "Pending poster edit cannot be backed by both contact poster and configuration", v14, 2u);
    }
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (id)pendingEditFromPosterConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = [[CNAvatarPosterCarouselPendingPosterEdit alloc] initWithContactPoster:0 posterConfiguration:v3];

  return v4;
}

+ (id)pendingEditFromContactPoster:(id)a3
{
  id v3 = a3;
  id v4 = [[CNAvatarPosterCarouselPendingPosterEdit alloc] initWithContactPoster:v3 posterConfiguration:0];

  return v4;
}

@end