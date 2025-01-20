@interface CUIKLocationDescriptionGenerator
+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5;
+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 incomplete:(BOOL *)a6 leadingImageName:(id *)a7;
+ (id)labelForLocation:(id)a3;
+ (id)locationStringForEvent:(id)a3;
+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4;
+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6;
+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7;
+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8;
@end

@implementation CUIKLocationDescriptionGenerator

+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4 incomplete:(BOOL *)a5 leadingImageName:(id *)a6
{
  return +[LocationDescriptionGenerator locationStringFor:a3 options:a4 incomplete:a5 leadingImageName:a6];
}

+ (id)locationStringForEvent:(id)a3 options:(unint64_t)a4
{
  return (id)[a1 locationStringForEvent:a3 options:a4 incomplete:0 leadingImageName:0];
}

+ (id)locationStringForEvent:(id)a3
{
  return (id)[a1 locationStringForEvent:a3 options:96 incomplete:0 leadingImageName:0];
}

+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7 options:(unint64_t)a8
{
  return +[LocationDescriptionGenerator locationStringFor:a3 locationWithoutPrediction:a4 preferredLocation:a5 conferenceURL:a6 conferenceURLIsBroadcast:a7 options:a8 incomplete:0 leadingImageName:0];
}

+ (id)locationStringForLocation:(id)a3 locationWithoutPrediction:(id)a4 preferredLocation:(id)a5 conferenceURL:(id)a6 conferenceURLIsBroadcast:(BOOL)a7
{
  return +[LocationDescriptionGenerator locationStringFor:a3 locationWithoutPrediction:a4 preferredLocation:a5 conferenceURL:a6 conferenceURLIsBroadcast:a7 options:96 incomplete:0 leadingImageName:0];
}

+ (id)labelForLocation:(id)a3
{
  return +[LocationDescriptionGenerator labelFor:a3];
}

+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5
{
  return +[LocationDescriptionGenerator conferenceStringFor:a3 conferenceURLIsBroadcast:a4 options:a5 outImageName:0 incomplete:0];
}

+ (id)conferenceStringForURL:(id)a3 conferenceURLIsBroadcast:(BOOL)a4 options:(unint64_t)a5 incomplete:(BOOL *)a6 leadingImageName:(id *)a7
{
  return +[LocationDescriptionGenerator conferenceStringFor:a3 conferenceURLIsBroadcast:a4 options:a5 outImageName:a7 incomplete:a6];
}

@end