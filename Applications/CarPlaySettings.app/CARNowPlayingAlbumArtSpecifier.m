@interface CARNowPlayingAlbumArtSpecifier
+ (BOOL)userSettingControlAvailable;
- (BOOL)albumArtDisabled;
- (CARNowPlayingAlbumArtSpecifier)initWithVehicle:(id)a3;
- (CARSettingsVehicleDelegate)vehicleDelegate;
- (CRVehicle)vehicle;
- (void)_performAction:(id)a3;
- (void)setAlbumArtDisabled:(BOOL)a3;
- (void)setAlbumArtUserPreference:(BOOL)a3;
- (void)setVehicle:(id)a3;
- (void)setVehicleDelegate:(id)a3;
@end

@implementation CARNowPlayingAlbumArtSpecifier

+ (BOOL)userSettingControlAvailable
{
  v2 = +[CRCarPlayCapabilities fetchCarCapabilities];
  BOOL v3 = ((unint64_t)[v2 disabledFeature] & 1) == 0;

  return v3;
}

- (CARNowPlayingAlbumArtSpecifier)initWithVehicle:(id)a3
{
  id v4 = a3;
  v5 = sub_1000210C8(@"ALBUM_ART_TITLE");
  v6 = +[CARSettingsImageCache albumArtImage];
  v12.receiver = self;
  v12.super_class = (Class)CARNowPlayingAlbumArtSpecifier;
  v7 = [(CARSettingsSwitchCellSpecifier *)&v12 initWithTitle:v5 image:v6];

  if (v7)
  {
    [(CARNowPlayingAlbumArtSpecifier *)v7 setVehicle:v4];
    objc_initWeak(&location, v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002AAC4;
    v9[3] = &unk_100092008;
    objc_copyWeak(&v10, &location);
    [(CARSettingsCellSpecifier *)v7 setActionBlock:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)setVehicle:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_vehicle, a3);
  vehicle = self->_vehicle;
  if (vehicle)
  {
    [(CARNowPlayingAlbumArtSpecifier *)self setAlbumArtDisabled:[(CRVehicle *)vehicle albumArtUserPreference] == (id)1];
  }
  else
  {
    v6 = +[CRCarPlayCapabilities fetchCarCapabilities];
    -[CARNowPlayingAlbumArtSpecifier setAlbumArtDisabled:](self, "setAlbumArtDisabled:", [v6 nowPlayingAlbumArtMode] == (id)1);
  }
  v7 = +[NSNumber numberWithInt:[(CARNowPlayingAlbumArtSpecifier *)self albumArtDisabled] ^ 1];
  [(CARSettingsCellSpecifier *)self setCellValue:v7];
}

- (void)_performAction:(id)a3
{
  if (a3) {
    unsigned int v4 = [a3 BOOLValue];
  }
  else {
    unsigned int v4 = [(CARNowPlayingAlbumArtSpecifier *)self albumArtDisabled];
  }
  [(CARNowPlayingAlbumArtSpecifier *)self setAlbumArtDisabled:v4 ^ 1];
  v5 = +[NSNumber numberWithInt:[(CARNowPlayingAlbumArtSpecifier *)self albumArtDisabled] ^ 1];
  [(CARSettingsCellSpecifier *)self setCellValue:v5];

  uint64_t v6 = [(CARNowPlayingAlbumArtSpecifier *)self albumArtDisabled] ^ 1;

  [(CARNowPlayingAlbumArtSpecifier *)self setAlbumArtUserPreference:v6];
}

- (void)setAlbumArtUserPreference:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  vehicle = self->_vehicle;
  if (vehicle)
  {
    if ([(CRVehicle *)vehicle albumArtUserPreference] != (id)v4)
    {
      [(CRVehicle *)self->_vehicle setAlbumArtUserPreference:v4];
      uint64_t v6 = [(CARNowPlayingAlbumArtSpecifier *)self vehicleDelegate];

      if (v6)
      {
        id v7 = [(CARNowPlayingAlbumArtSpecifier *)self vehicleDelegate];
        [v7 saveVehicle:self->_vehicle];
      }
    }
  }
}

- (CRVehicle)vehicle
{
  return self->_vehicle;
}

- (CARSettingsVehicleDelegate)vehicleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_vehicleDelegate);

  return (CARSettingsVehicleDelegate *)WeakRetained;
}

- (void)setVehicleDelegate:(id)a3
{
}

- (BOOL)albumArtDisabled
{
  return self->_albumArtDisabled;
}

- (void)setAlbumArtDisabled:(BOOL)a3
{
  self->_albumArtDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_vehicleDelegate);

  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end